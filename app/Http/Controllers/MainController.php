<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Database\QueryException;

use App\Models\User;

use Hash;
use ADHhelper;

class MainController extends Controller
{
    function profil() {
    	$profil = ADHhelper::getUserData();
    	$profil->npp = $profil->pegawai ? $profil->pegawai->npp : $profil->username;
    	$profil->nama = $profil->pegawai ? $profil->pegawai->nama : $profil->username;
        if ($profil->pegawai) {
            switch ($profil->pegawai->tipe) {
                case 'pw':
                    $profil->tipe = 'Pegawai';
                    break;
                case 'pg':
                    $profil->tipe = 'Pengemudi';
                    break;
                case 'pj':
                    $profil->tipe = 'Petugas Jaga';
                    break;
                case 'fu':
                    $profil->tipe = 'Fungsi Umum';
                    break;
                default:
                    $profil->tipe = '#N/A';
                    break;
            } 
        } else {
            $profil->tipe = $profil->username;
        }
    	switch ($profil->level) {
    		case 'a':
    			$profil->level = 'Admin';
    			break;
    		case 'pw':
    			$profil->level = 'Pegawai';
    			break;
    		case 'pg':
    			$profil->level = 'Pengemudi';
    			break;
    		case 'pj':
    			$profil->level = 'Petugas Jaga';
    			break;
    		case 'fu':
    			$profil->level = 'Fungsi Umum';
    			break;
    		default:
    			$profil->level = '#N/A';
    			break;
    	}

		return view('template.profil', compact(['profil']));
	}

    function saveProfil(Request $request) {
    	$request->validate([
    		'password' => 'required|confirmed',
    	]);
    	
    	$datas = [];
    	$datas['updated_at'] = date('Y-m-d H:i:s');
        $datas['updated_by'] = session('userID');
		$datas['password'] = Hash::make($request->password);


		User::where(['id' => session('userID')])->update($datas);

		return redirect()->route('main.profil')->with('alert', [
            'title' => 'BERHASIL !!!',
            'message' => 'Berhasil Ubah Profil',
            'class' => 'success',
        ]);
	}

    function index() {
		if (session('login') == true) {
			return redirect()->route('materi.index');
		} else {
			return view('template.login');
		}
	}

	function login(Request $request) {
		$user = User::where(['username' => $request->username])->first();
		if ($user != null && Hash::check($request->password, $user->password)) {
			$userData = [];
			$userData['userID'] = $user->id;
			$userData['login'] = true;

			session($userData);

			return redirect()->route('main.index');
		} else {
			return redirect()->route('main.index')->with('alert', [
                'title' => 'GAGAL !!!',
                'message' => 'Username atau Password Salah !!!',
                'class' => 'error',
            ]);
		}
	}

	function logout() {
		session()->flush();

		return redirect()->route('main.index');
	}
}
