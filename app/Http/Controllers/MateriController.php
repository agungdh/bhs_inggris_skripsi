<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Database\QueryException;

use App\Models\Materi;
use App\Models\Berkas;
use App\Models\Soal;
use App\Models\Ujian;

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
            'jumlah_pertanyaan_ujian' => 'required|numeric|min:0',
            'jumlah_pertanyaan_mid' => 'required|numeric|min:0',
        ]);

        $data = $request->only('unit', 'materi', 'deskripsi', 'jumlah_pertanyaan_ujian', 'jumlah_pertanyaan_mid');
        
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
            'jumlah_pertanyaan_ujian' => 'required|numeric|min:0',
            'jumlah_pertanyaan_mid' => 'required|numeric|min:0',
        ]);

        $data = $request->only('unit', 'materi', 'deskripsi', 'jumlah_pertanyaan_ujian', 'jumlah_pertanyaan_mid');
        
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

    public function ujian($id_materi)
    {
        $materi = Materi::find($id_materi);
        $soals = Soal::where('id_materi', $materi->id)->inRandomOrder()->limit($materi->jumlah_pertanyaan_ujian)->get();

        return view('materi.ujian', compact(['materi', 'soals']));
    }

    public function simpanUjian(Request $request, $id_materi)
    {
        $materi = Materi::find($id_materi);
        
        $jawabans = $request->soal ?: [];
        $soals_raw = array_keys($jawabans);
        $soals = Soal::whereIn('id', $soals_raw)->get();

        $benar = 0;
        foreach ($soals as $soal) {
            if ($jawabans[$soal->id] == $soal->kunci) {
                $benar++;
            }
        }

        $nilai = (int)($benar / $materi->jumlah_pertanyaan_ujian * 100);

        Ujian::insert([
            'id_user' => session('userID'),
            'id_materi' => $id_materi,
            'nilai' => $nilai,
            'waktu' => date('Y-m-d H:i:s'),
        ]);

        return redirect()->route('materi.index');
    }

    public function nilai($id_materi)
    {
        $materi = Materi::find($id_materi);
        $nilais = Ujian::where('id_materi', $materi->id)->with('user')->get();

        return view('materi.nilai', compact(['materi', 'nilais']));
    }

    public function hapusNilai($id)
    {
        $ujian = Ujian::find($id);
        try {
            Ujian::where(['id' => $id])->delete();   
        } catch (QueryException $exception) {
            return redirect()->back()->with('alert', [
                'title' => 'ERROR !!!',
                'message' => config('app.debug') ? $exception->getMessage() : 'Something Went Wrong !!!',
                'class' => 'error',
            ]);        
        }

        return redirect()->route('materi.nilai', $ujian->id_materi)->with('alert', [
            'title' => 'BERHASIL !!!',
            'message' => 'Berhasil Hapus Data',
            'class' => 'success',
        ]);  
    }
}
