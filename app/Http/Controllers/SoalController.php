<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Database\QueryException;

use App\Models\Soal;
use App\Models\Materi;

use ADHhelper;

use DB;
use Validator;

class SoalController extends Controller
{

    public function index($id_materi)
    {
        $materi = Materi::with('soals')->find($id_materi);
        $soals = $materi->soals;

        return view('soal.index', compact(['materi', 'soals']));
    }

    public function create($id_materi)
    {
        $materi = Materi::find($id_materi);
        $kuncis = [
            'a' => 'A',
            'b' => 'B',
            'c' => 'C',
            'd' => 'D',
            'e' => 'E',
        ];

        return view('soal.create', compact(['materi', 'kuncis']));
    }

    public function store(Request $request, $id_materi)
    {
        $request->validate([
            'pertanyaan' => 'required',
            'jawaban_a' => 'required',
            'jawaban_b' => 'required',
            'jawaban_c' => 'required',
            'jawaban_d' => 'required',
            'jawaban_e' => 'required',
            'kunci' => 'required',
        ]);

        $data = $request->only('pertanyaan','jawaban_a','jawaban_b','jawaban_c','jawaban_d','jawaban_e','kunci');
        $data['id_materi'] = $id_materi;
        
        DB::table('soal')->insert($data);

        return redirect()->route('soal.index', $id_materi)->with('alert', [
            'title' => 'BERHASIL !!!',
            'message' => 'Berhasil Tambah Data',
            'class' => 'success',
        ]);
    }

    public function edit($id)
    {
        $soal = Soal::find($id);
        $materi = $soal->materi;
        $kuncis = [
            'a' => 'A',
            'b' => 'B',
            'c' => 'C',
            'd' => 'D',
            'e' => 'E',
        ];

        return view('soal.edit', compact(['soal', 'materi', 'kuncis']));
    }

    public function update(Request $request, $id)
    {        
        $soal = Soal::find($id);

       $request->validate([
            'pertanyaan' => 'required',
            'jawaban_a' => 'required',
            'jawaban_b' => 'required',
            'jawaban_c' => 'required',
            'jawaban_d' => 'required',
            'jawaban_e' => 'required',
            'kunci' => 'required',
        ]);

        $data = $request->only('pertanyaan','jawaban_a','jawaban_b','jawaban_c','jawaban_d','jawaban_e','kunci');
        $data['id_materi'] = $soal->id_materi;

        Soal::where(['id' => $id])->update($data);

        return redirect()->route('soal.index', $soal->id_materi)->with('alert', [
            'title' => 'BERHASIL !!!',
            'message' => 'Berhasil Ubah Data',
            'class' => 'success',
        ]);        
    }

    public function destroy($id)
    {     
        $sewaKendaraan = SewaKendaraan::find($id);

        try {
            SewaKendaraan::where(['id' => $id])->delete();   
        } catch (QueryException $exception) {
            return redirect()->back()->with('alert', [
                'title' => 'ERROR !!!',
                'message' => config('app.debug') ? $exception->getMessage() : 'Something Went Wrong !!!',
                'class' => 'error',
            ]);        
        }

        return redirect()->route('soal.index', $sewaKendaraan->id_kendaraan)->with('alert', [
            'title' => 'BERHASIL !!!',
            'message' => 'Berhasil Hapus Data',
            'class' => 'success',
        ]);        
    }
}
