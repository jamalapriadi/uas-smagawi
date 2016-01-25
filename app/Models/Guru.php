<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;

class Guru extends Authenticatable{
	protected $table="guru";

	protected $primaryKey="nip";
	public $incrementing=false;

	public $timestamps=false;

	public static $rules=[
		'nip'=>'required',
		'nama'=>'required',
		'password'=>'required',
		'mapel'=>'required'
	];

	public static $rulesupdate=[
		'nip'=>'required',
		'nama'=>'required',
		'mapel'=>'required'
	];

	public static $pesan=[
		'nip.required'=>'NIP harus diisi',
		'nama.required'=>'Nama harus diisi',
		'password.required'=>'Password harus diisi',
		'mapel.required'=>'Mata Pelajaran harus diisi'
	];

	public function mapel(){
		return $this->belongsTo('App\Models\Mapel','kd_mapel');
	}
}