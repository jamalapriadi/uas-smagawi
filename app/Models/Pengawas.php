<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;

class Pengawas extends Authenticatable{
	protected $table="pengawas";
	protected $primaryKey="nip";

	public $incrementing=false;

	public $timestamps=false;

	public static $rules=[
		'nip'=>'required',
		'nama'=>'required',
		'password'=>'required'
	];

	public static $pesan=[
		'nip.required'=>'NIP Harus diisi',
		'nama.required'=>'Nama Harus diisi',
		'password.required'=>'Password harus diisi'
	];

	public function djadwal(){
		return $this->hasOne('App\Models\Djadwal','pengawas');
	}
}