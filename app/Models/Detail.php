<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Detail extends Model{
	protected $table="detail_soal";

	public $timestamps=false;

    public function soalsiswa(){
        return $this->hasOne('App\Models\Soalsiswa','id_detail_soal');
    }
}