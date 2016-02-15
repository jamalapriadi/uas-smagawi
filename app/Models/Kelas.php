<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Kelas extends Model{
	protected $table="kelas";
	protected $primaryKey="kd_kelas";
	public $incrementing=false;

	public $timestamps=false;

	static $rulesbaru=[
		'kode'=>'required',
		'jurusan'=>'required',
		'sub'=>'required'
	];

	static $rules=[
		'kode'=>'required',
		'jurusan'=>'required',
		'sub'=>'required',
		'rombel.required'=>'Rombel harus diisi'
	];

	static $pesan=[
		'kode.required'=>'Kode harus diisi',
		'jurusan.required'=>'Jurusan harus diisi',
		'sub.required'=>'Sub Kelas harus diisi'
	];


	public function jurusan(){
		return $this->belongsTo('App\Models\Jurusan','kode_jurusan');
	}

	public function siswa(){
		return $this->hasOne('App\Models\Siswa','kd_kelas');
	}
}