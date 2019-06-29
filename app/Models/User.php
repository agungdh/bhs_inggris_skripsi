<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    protected $table = 'user';
    protected $primaryKey = 'id';
    public $timestamps = false;

	protected $hidden = [
					        'password',
					    ];

	public function pegawai()
    {
        return $this->belongsTo('App\Models\Pegawai', 'id_pegawai');
    }
}
