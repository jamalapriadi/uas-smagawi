<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Mapel extends Model{
	protected $table="mapel";
	protected $primaryKey="kd_mapel";
	public $incrementing=false;

	public $timestamps=false;

	public static $rules=[
		'kode'=>'required',
		'nama'=>'required'
	];

	public static $pesan=[
		'kode.required'=>'Kode harus diisi',
		'nama.required'=>'Nama harus diisi'
	];

	public function guru(){
		return $this->hasOne('App\Models\Guru','kd_mapel');
	}

}