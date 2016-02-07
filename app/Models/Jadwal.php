<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;


class Jadwal extends Model{
	protected $table="jadwal";

	protected $primaryKey="id_jadwal";

	public $incrementing=false;
	
	public $timestamps=false;	

	public static $rules=[
		'mapel'=>'required',
		'tanggal'=>'required',
		'jam'=>'required',
		'lama'=>'required',
		'selesai'=>'required'
	];

	public static $pesan=[
		'mapel.required'=>'Mata Pelajaran harus diisi',
		'tanggal.required'=>'Tanggal harus diisi',
		'jam.required'=>'Jam Harus diisi',
		'lama.required'=>'Lama Ujian harus diisi',
		'selesai.required'=>'Jam Selesai harus diisi'
	];

	public function detail(){
		return $this->hasOne('App\Models\Djadwal','id_jadwal');
	}
}