<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;

use App\Http\Controllers\Controller;
use App\Models\Pengawas;
use App\Models\viewDetailJadwal;
use App\Models\Ruang;
use App\Models\Mapel;
use App\Models\Djadwal;

use DB,Redirect,Validator,Session;

class PengawasArea extends Controller{
	public function index(){
		$tgl=Date('Y-m-d');
		$jam=Date('H:i:s');

		$pengawas=$this->getPengawas();

		$mengawasi=DB::table('view_detail_jadwal')
			->where('pengawas',$pengawas->nip)
			->where('tgl_ujian',$tgl)
			->where('jam','<=',$jam)
			->where('selesai','>=',$jam)
			->first();

		if(count($mengawasi)>0){
			Session::put('id',$mengawasi->id);

			$ruang=Ruang::find($mengawasi->id_ruang);
			$mapel=Mapel::find($mengawasi->kd_mapel);

			return View('pengawas.index')
				->with('pengawas',$pengawas)
				->with('mengawasi',$mengawasi)
				->with('ruang',$ruang)
				->with('mapel',$mapel);
		}else{
			if(Session::has('id')){
				$mengawasi=viewDetailJadwal::find(Session::get('id'));

				$ruang=Ruang::find($mengawasi->id_ruang);
				$mapel=Mapel::find($mengawasi->kd_mapel);

				return View('pengawas.index')
					->with('pengawas',$pengawas)
					->with('mengawasi',$mengawasi)
					->with('ruang',$ruang)
					->with('mapel',$mapel);
			}else{
				return View('pengawas.sudah_selesai');
			}
		}
	}

	public function load_siswa(Request $request){
		if($request->ajax()){
			$kelas=$request->input('kelas');
			$ruang=$request->input('ruang');
			$sesi=$request->input('sesi');

			$siswa=DB::select("select a.*,b.id_ruang from siswa a,peserta_ujian b
				where a.nis=b.nis and a.kd_kelas='".$kelas."' 
				and b.id_ruang='".$ruang."'
				and b.sesi='".$sesi."'");

			return View('pengawas.load_siswa')
				->with('siswa',$siswa);
		}
	}

	public function getSiswalogin(Request $request){

	}

	public function get_token(Request $request){
		if($request->ajax()){
			$id=$request->input('idmengawasi');
			$djadwal=djadwal::find($id);
			$djadwal->token=str_random(6);
			$djadwal->jam_mulai=date('H:i:s');
			$djadwal->save();

			return $djadwal->token;
		}
	}

	public function getPengawas(){
		$pengawas=Pengawas::find($this->getNip());

		return $pengawas;
	}

	public function getNip(){
		return auth()->guard('pengawas')->user()->nip;
	}
}