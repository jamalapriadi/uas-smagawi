<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Jurusan extends Model{
	protected $table="jurusan";
	protected $primaryKey="kode_jurusan";
	public $incrementing=false;

	public $timestamps=false;

	public static $rulesbaru=[
		'kode'=>'required|unique:jurusan,kode_jurusan',
		'nama'=>'required'
	];

	public static $rules=[
		'kode'=>'required',
		'nama'=>'required'
	];

	public static $pesan=[
		'kode.required'=>'Kode harus diisi',
		'kode.unique'=>'Kode sudah ada',
		'nama.required'=>'Nama harus diisi'
	];

	public function kelas(){
		return $this->hasOne('App\Models\Kelas','kode_jurusan');
	}
}