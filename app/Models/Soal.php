<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Soal extends Model
{
    protected $table = 'soal';
    public $timestamps = false;

    public function materi()
    {
        return $this->belongsTo('App\Models\Materi', 'id_materi');
    }

}
