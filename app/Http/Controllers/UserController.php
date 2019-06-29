<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Database\QueryException;

use App\Models\User;
use App\Models\Pegawai;

use ADHhelper;

use Hash;
use DB;

class UserController extends Controller
{
    public function index()
    {
        $users = User::with('pegawai')->get();

        return view('user.index', compact(['users']));
    }

    public function create()
    {
        $pegawais_raw = Pegawai::all();

        $pegawais = [];
        foreach ($pegawais_raw as $item) {
            $pegawais[$item->id] = "{$item->npp} - {$item->nama}";
        }

        return view('user.create', compact(['pegawais']));
    }

    public function store(Request $request)
    {
        $validate = [
            'username' => 'required_without:id_pegawai|unique:user,username',
            'password' => 'required|confirmed',
        ];

        if ($request->id_pegawai) {
            $validate['id_pegawai'] = 'unique:user,id_pegawai';
        }

        $request->validate($validate);

        $data = [];
        $data['password'] = Hash::make($request->password);
        if ($request->id_pegawai) {
            $pegawai = Pegawai::find($request->id_pegawai);

            $data['username'] = $pegawai->npp;
            $data['id_pegawai'] = $pegawai->id;
        } else {
            $data['username'] = $request->username;
        }
        $data['created_at'] = date('Y-m-d H:i:s');
        $data['created_by'] = session('userID');
        $data['updated_at'] = date('Y-m-d H:i:s');
        $data['updated_by'] = session('userID');

        DB::table('user')->insert($data);

        return redirect()->route('user.index')->with('alert', [
            'title' => 'BERHASIL !!!',
            'message' => 'Berhasil Tambah Data',
            'class' => 'success',
        ]);
    }

    public function edit($id)
    {
        $pegawais_raw = Pegawai::all();

        $pegawais = [];
        foreach ($pegawais_raw as $item) {
            $pegawais[$item->id] = "{$item->npp} - {$item->nama}";
        }

        $user = User::find($id);

        return view('user.edit', compact(['pegawais', 'user']));
    }

    public function update(Request $request, $id)
    {
        $user = User::find($id);

        $validate = [
            'username' => 'required_without:id_pegawai',
            'password' => 'confirmed',
        ];

        if ($request->id_pegawai && $user->id_pegawai != $request->id_pegawai ) {
            $validate['id_pegawai'] = 'unique:user,id_pegawai';
        } elseif (!$request->pegawai) {
            $validate['username'] .= '|unique:user,username';
        }

        $request->validate($validate);

        $data = [];
        if ($request->password) {
            $data['password'] = Hash::make($request->password);
        }
        if ($request->id_pegawai) {
            $pegawai = Pegawai::find($request->id_pegawai);

            $data['username'] = $pegawai->npp;
            $data['id_pegawai'] = $pegawai->id;
        } else {
            $data['id_pegawai'] = null;
            $data['username'] = $request->username;
        }
        $data['updated_at'] = date('Y-m-d H:i:s');
        $data['updated_by'] = session('userID');

        User::where('id', $id)->update($data);

        return redirect()->route('user.index')->with('alert', [
            'title' => 'BERHASIL !!!',
            'message' => 'Berhasil Ubah Data',
            'class' => 'success',
        ]);        
    }

    public function destroy($id)
    {
        try {
            User::where(['id' => $id])->delete();
        } catch (QueryException $exception) {
            return redirect()->back()->with('alert', [
                'title' => 'ERROR !!!',
                'message' => config('app.debug') ? $exception->getMessage() : 'Something Went Wrong !!!',
                'class' => 'error',
            ]);        
        }

        return redirect()->route('user.index')->with('alert', [
            'title' => 'BERHASIL !!!',
            'message' => 'Berhasil Hapus Data',
            'class' => 'success',
        ]);        
    }
}
