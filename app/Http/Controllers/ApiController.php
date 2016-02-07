<?php
namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Siswa;
use DB;
use App\Models\Jadwal;

use Ramsey\Uuid\Uuid;

class ApiController extends Controller{
	public function siswa(){
		$siswa=Siswa::all();

		return json_encode($siswa);
	}

    public function tes(){
        // Generate a version 1 (time-based) UUID object
        $jadwal=Jadwal::all();

        print_r($jadwal);
        //return Uuid::uuid4()->getHex();
    }

    public function acak(){
        $detailsoal=DB::table('detail_soal')
                            ->where('id_soal',4)
                            ->orderBy(DB::raw('RAND()'))
                            ->get();
        print_r($detailsoal);
    }
}