<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Models\Siswa;

class SiswaArea extends Controller{

	public function index(){
		$siswa=$this->getSiswa();

		return View('siswa.index')
			->with('siswa',$siswa);
	}

	public function lihat_ujian(){
		$siswa=$this->getSiswa();

		return View('siswa.lihat_ujian');
	}

	public function ujian_berlangsung(){
		return View('siswa.ujian_berlangsung');
	}

	public function pilih_soal(Request $request){
		if($request->ajax()){
			$no=$request->input('no');
			return View('siswa.pilih-soal')
				->with('no',$no);
		}
	}

	public function selesai(){
		return View('siswa.selesai');
	}

	public function getSiswa(){
		$siswa=Siswa::find($this->getNis());

		return $siswa;
	}

	public function getNis(){
		return auth()->guard('siswa')->user()->nis;
	}
}