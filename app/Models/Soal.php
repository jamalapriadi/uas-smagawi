<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Soal extends Model{
	protected $table="soal";

	public $timestamps=false;

	public static $rules=[
		'mapel'=>'required',
		'jurusan'=>'required',
		'waktu'=>'required'
	];

	public static $pesan=[
		'mapel.required'=>'Mata Pelajaran harus diisi',
		'jurusan.required'=>'Jurusan harus diisi',
		'waktu.required'=>'Waktu Ujian harus diisi'
	];

	public function guru(){
		return $this->belongsTo('App\Models\Guru','author');
	}
}