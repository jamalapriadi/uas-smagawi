<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;


class Djadwal extends Model{
	protected $table="detail_jadwal";

    public $incrementing=false;
	public $timestamps=false;

    public function getpengawas(){
        return $this->belongsTo('App\Models\Pengawas','pengawas');
    }

    public function ruang(){
        return $this->belongsTo('App\Models\Ruang','id_ruang');
    }

    public function jadwal(){
        return $this->belongsTo('App\Models\Jadwal','id_jadwal');
    }
}