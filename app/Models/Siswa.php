<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;

class Siswa extends Authenticatable{
	protected $table="siswa";

	protected $primaryKey="nis";
	public $incrementing=false;

	public $timestamps=false;

	public static $rules=[
		'nis'=>'required|unique:siswa,nis',
		'nama'=>'required',
		'password'=>'required',
		'kelas'=>'required'
	];

	public static $rulesupdate=[
		'nama'=>'required',
		'kelas'=>'required'
	];

	public static $pesan=[
		'nis.required'=>'NIS harus diisi',
		'nis.unique'=>'Nis sudah ada',
		'nama.required'=>'Nama harus diisi',
		'password.required'=>'Password harus diisi',
		'kelas.required'=>'Kelas harus diisi'
	];

	public function kelas(){
		return $this->belongsTo('App\Models\Kelas','kd_kelas');
	}

	public function peserta(){
		return $this->hasOne('App\Models\Peserta','nis');
	}
}