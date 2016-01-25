<?php
namespace App\Models;

class Peserta extends Model{
	protected $table="peserta_ujian";

	public $timestamps=false;

	public static $rules=[
		'jadwal'=>'required',
		'nis'=>'required',
		'ruang'=>'required'
	];

	public static $pesan=[
		'jadwal.required'=>'Jadwal harus diisi',
		'nisn.required'=>'NIS harus diisi',
		'ruang.required'=>'Ruang harus diisi'
	];
}