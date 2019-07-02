<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Materi extends Model
{
    protected $table = 'materi';
    public $timestamps = false;

    public function berkas()
    {
        return $this->hasOne('App\Models\Berkas', 'id_materi');
    }
}
