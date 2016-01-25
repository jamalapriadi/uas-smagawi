<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;


class Jadwal extends Model{
	protected $table="jadwal";

	protected $primaryKey="id_jadwal";

	public $timestamps=false;	

	public static $rules=[
		'mapel'=>'required',
		'tanggal'=>'required',
		'jam'=>'required'
	];

	public static $pesan=[
		'mapel.required'=>'Mata Pelajaran harus diisi',
		'tanggal.required'=>'Tanggal harus diisi',
		'jam.required'=>'Jam Harus diisi'
	];
}