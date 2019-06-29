<?php

namespace App\Helpers;

use Illuminate\Support\Facades\Route;

use App\Models\User;
use App\Models\Menu;
use App\Models\HakAkses;

use agungdh\Pustaka;

use DB;

class ADHhelper extends Pustaka
{
    public static function getUserData() {
        return User::with('pegawai')->find(session('userID'));
    }
}
