<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Ruang extends Model{
	protected $table="ruang_ujian";

	protected $primaryKey="id_ruang";
	public $incrementing=false;

	public $timestamps=false;

	public static $rules=[
		'nama'=>'required',
		'kuota'=>'required'
	];

	public static $pesan=[
		'nama.required'=>'Nama harus diisi',
		'kuota.required'=>'Kuota harus diisi'
	];

	public function Djadwal(){
		return $this->hasOne('App\Models\Djadwal','id_ruang');
	}

	public function peserta(){
		return $this->hasOne('App\Models\Peserta','id_ruang');
	}
}