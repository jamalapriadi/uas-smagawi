<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;


class Djadwal extends Model{
	protected $table="detail_jadwal";

	public $timestamps=false;

    public function getpengawas(){
        return $this->belongsTo('App\Models\Pengawas','pengawas');
    }
}