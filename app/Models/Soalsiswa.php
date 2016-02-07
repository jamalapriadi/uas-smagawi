<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class Soalsiswa extends Model{
    protected $table="soal_siswa";

    protected $primaryKey="id";

    public $incrementing=false;

    public $timestamps=false;

    public function detail(){
        return $this->belongsTo('App\Models\Detail','id_detail_soal');
    }
}