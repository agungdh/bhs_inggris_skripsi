<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Database\QueryException;

use App\Models\Materi;

use ADHhelper;

use DB;

class MateriController extends Controller
{

    public function berkas($id)
    {
        $materi = Materi::with('berkas')->find($id);

        $filePath = storage_path('app/public/files/berkas/' . $materi->berkas->id);
        $fileName = $materi->berkas->filename;

        return ADHhelper::openFileWithFileName($filePath, $fileName);
    }

    public function index()
    {
        $materis = Materi::all();

        return view('materi.index', compact(['materis']));
    }

    public function create()
    {
        return view('materi.create', compact([]));
    }

    public function store(Request $request)
    {
        $request->validate([
            'unit' => 'required',
            'materi' => 'required',
            'deskripsi' => 'required',
            'berkas' => 'required|file|mimes:pdf',
        ]);

        $data = $request->only('unit', 'materi', 'deskripsi');
        
        $id_materi = DB::table('materi')->insertGetId($data);

        $berkas = $request->file('berkas');
        $id_files = DB::table('files')->insertGetId([
            'id_materi' => $id_materi,
            'filename' => $berkas->getClientOriginalName(),
        ]);

        $berkas->move(storage_path('app/public/files/berkas'), $id_files);

        return redirect()->route('materi.index')->with('alert', [
            'title' => 'BERHASIL !!!',
            'message' => 'Berhasil Tambah Data',
            'class' => 'success',
        ]);
    }

    public function edit($id)
    {
        $fungsiUmum = Pegawai::find($id);

        return view('materi.edit', compact(['fungsiUmum']));
    }

    public function update(Request $request, $id)
    {        
        $fungsiUmum = Pegawai::find($id);

        $request->validate([
            'npp' => 'required',
            'nama' => 'required',
        ]);

        if ($request->npp != $fungsiUmum->npp) {
            $request->validate([
                'npp' => 'unique:pegawai,npp',
            ]);
        }

        $data = $request->only('nama', 'npp');
        $data['updated_at'] = date('Y-m-d H:i:s');
        $data['updated_by'] = session('userID');
        
        Pegawai::where(['id' => $id])->update($data);

        return redirect()->route('materi.index')->with('alert', [
            'title' => 'BERHASIL !!!',
            'message' => 'Berhasil Ubah Data',
            'class' => 'success',
        ]);        
    }

    public function destroy($id)
    {     
        try {
            Pegawai::where(['id' => $id])->delete();   
        } catch (QueryException $exception) {
            return redirect()->back()->with('alert', [
                'title' => 'ERROR !!!',
                'message' => config('app.debug') ? $exception->getMessage() : 'Something Went Wrong !!!',
                'class' => 'error',
            ]);        
        }

        return redirect()->route('materi.index')->with('alert', [
            'title' => 'BERHASIL !!!',
            'message' => 'Berhasil Hapus Data',
            'class' => 'success',
        ]);        
    }
}
