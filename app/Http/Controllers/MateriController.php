<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Database\QueryException;

use App\Models\Materi;
use App\Models\Berkas;

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
        $materi = Materi::find($id);

        return view('materi.edit', compact(['materi']));
    }

    public function update(Request $request, $id)
    {        
        $materi = Materi::find($id);

        $request->validate([
            'unit' => 'required',
            'materi' => 'required',
            'deskripsi' => 'required',
            'berkas' => 'file|mimes:pdf',
        ]);

        $data = $request->only('unit', 'materi', 'deskripsi');
        
        Materi::where('id', $id)->update($data);

        $berkas = $request->file('berkas');
        if ($berkas) {
            $files = $materi->berkas;
            $files->filename = $berkas->getClientOriginalName();
            $files->save();
            
            $berkas->move(storage_path('app/public/files/berkas'), $files->id);
        }

        return redirect()->route('materi.index')->with('alert', [
            'title' => 'BERHASIL !!!',
            'message' => 'Berhasil Ubah Data',
            'class' => 'success',
        ]);        
    }

    public function destroy($id)
    {     
        try {
            $berkas = Berkas::where(['id_materi' => $id])->first();   
            Berkas::where(['id_materi' => $id])->delete();   
            unlink(storage_path('app/public/files/berkas/' . $berkas->id));
            Materi::where(['id' => $id])->delete();   
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
