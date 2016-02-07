<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Models\Siswa;
use App\Models\Ruang;
use App\Models\Peserta;
use App\Models\Jadwal;
use App\Models\Soal;
use App\Models\Detail;
use App\Models\Djadwal;
use App\Models\Soalsiswa;

use DB,Validator,Session,Redirect;

use Ramsey\Uuid\Uuid;

class SiswaArea extends Controller{
	public function __construct(){
		date_default_timezone_set('Asia/Jakarta');
	}

	public function index(){
		$siswa=$this->getSiswa();

		$peserta=Peserta::where('nis',$siswa->nis)->first();

		return View('siswa.index')
			->with('siswa',$siswa)
			->with('peserta',$peserta);
	}

	public function proses_lihat_ujian(Request $request){
		$tgl=Date('Y-m-d');
		$jam=Date('H:i:s');

		$rules=['jurusan'=>'required'];
		$pesan=['jurusan.required'=>'Jurusan harus diisi'];

		$validasi=Validator::make($request->all(),$rules,$pesan);

		if($validasi->fails()){
			Session::flash('pesan',"Data Anda tidak Valid");
			return Redirect::back();
		}else{
			Session::put('jurusan',$request->jurusan);
			$jurusan=$request->jurusan;

			$siswa=$this->getSiswa();
			$ruang=Peserta::where('nis',$siswa->nis)->first();

			$jadwal=DB::table('view_jadwal')
				->where('id_ruang',$ruang->id_ruang)
				->where('tgl_ujian',$tgl)
				->where('kode_jurusan',$jurusan)
				->get();
			
			if(count($jadwal)>0){
				foreach($jadwal as $row){
					//jika jam mulai dan jam sekarang sama atau kurang setengah jam, maka tampilkan
					if($jam>=$row->jam && $jam<=$row->selesai){
						$adajadwal=Jadwal::find($row->id_jadwal);
						return View('siswa.lihat_ujian')
							->with('jadwal',$adajadwal);
					}else{
						Session::flash('pesan',"Tidak ada Jadwal Ujian");
						return Redirect::to('siswa');
					}
				}
			}else{
				Session::flash('pesan',"Tidak ada Jadwal Ujian");
				return Redirect::to('siswa');
			}
		}
	}

	public function lihat_ujian(){
		if(Session::has('jurusan')){
			$tgl=Date('Y-m-d');
			$jam=Date('H:i:s');
			$jurusan=Session::get('jurusan');

			$siswa=$this->getSiswa();
			$ruang=Peserta::where('nis',$siswa->nis)->first();

			$jadwal=DB::table('view_jadwal')
				->where('id_ruang',$ruang->id_ruang)
				->where('tgl_ujian',$tgl)
				->where('kode_jurusan',$jurusan)
				->get();

			if(count($jadwal)>0){
				foreach($jadwal as $row){
					//jika jam mulai dan jam sekarang sama atau kurang setengah jam, maka tampilkan
					if($jam>=$row->jam && $jam<=$row->selesai){
						$adajadwal=Jadwal::find($row->id_jadwal);
						return View('siswa.lihat_ujian')
							->with('jadwal',$adajadwal);
					}else{
						Session::flash('pesan',"Tidak ada Jadwal Ujian");
						return Redirect::to('siswa');
					}
				}
			}else{
				Session::flash('pesan',"Tidak ada Jadwal Ujian");
				return Redirect::to('siswa');
			}
		}else{
			Session::flash('pesan',"Tidak ada Jadwal Ujian");
			return Redirect::to('siswa');
		}
	}

	public function ujian_berlangsung(Request $request){
		$rules=['token'=>'required'];
		$pesan=['token.required'=>'Token harus diisi'];

		$validasi=Validator::make($request->all(),$rules,$pesan);

		if($validasi->fails()){
			return Redirect::back()
				->withInput()
				->withErrors($validasi);
		}else{
			//cek apakah token yang dimasukkan sama dengan jadwal ini atau tidak
			$djadwal=djadwal::find($request->input('detailjadwal'));

			if($request->input('token')==$djadwal->token){
				//setelah token sesuai, maka cek apakah user ini sudah pernah membuka halaman ini atau belum
				//seharusnya ketika sudah pernah membuka halaman ini maka user ini sudah mendapatkan soal
				//secara random, jika belum maka random soal untuk user ini.
				$idjadwal=$request->input('idjadwal');
				$detail_jadwal=$request->input('detailjadwal');

				Session::put('jadwal',$idjadwal);
				Session::put('detailjadwal',$detail_jadwal);

				$soal=DB::table('soal_siswa')
					->where('id_jadwal',$idjadwal)
					->where('id_detail_jadwal',$detail_jadwal)
					->where('nis',$this->getNis());

				if($soal->count()>0){
					return Redirect::to('siswa/ujian-berlangsung/'.$idjadwal.'/'.$detail_jadwal);

				}else{
					//cari data jadwal
					$jadwal=Jadwal::find($idjadwal);

					//cari soal yang mata pelajaran dan jurusannya sama dengan jadwal
					$carisoal=Soal::where('kd_mapel',$jadwal->kd_mapel)
						->where('kode_jurusan',$jadwal->kode_jurusan);

					if($carisoal->count()>0){
						$hasilsoal=$carisoal->first();

						$detailsoal=DB::table('detail_soal')
							->where('id_soal',$hasilsoal->id)
							->orderBy(DB::raw('RAND()'))
							->get();

						$no=0;
						foreach($detailsoal as $row){
							$no++;

							$data=array(
								'id'=>Uuid::uuid4()->getHex(),
								'nis'=>$this->getNis(),
								'id_jadwal'=>$idjadwal,
								'id_detail_jadwal'=>$detail_jadwal,
								'id_soal'=>$row->id_soal,
								'id_detail_soal'=>$row->id,
								'soal_ke'=>$no,
								'status'=>0
							);

							DB::table('soal_siswa')->insert($data);
						}
						return Redirect::to('siswa/ujian-berlangsung/'.$idjadwal.'/'.$detail_jadwal);
					}
				}
			}else{
				Session::flash('pesan',"Token Tidak sesuai");
				return Redirect::back();
			}
		}
	}

	public function sedang_ujian(Request $request,$jadwal,$detail){
		$infojadwal=Jadwal::find($jadwal);

		//hitung jam
		$awal=date('H:i:s');
		$akhir=date('H:i:s',strtotime($infojadwal->selesai));

		list($h,$m,$s)=explode(":",$awal);
		$dtawal=mktime($h,$m,$s,"1","1","1");

		list($h2,$m2,$s2)=explode(":",$akhir);
		$dtakhir=mktime($h2,$m2,$s2,"1","1","1");

		$dtselisih=$dtakhir-$dtawal;

		$totaldetik=$dtselisih;
		//end hitung jam

		$detailsoal=DB::Table('soal_siswa')
			->where('nis',$this->getNis())
			->where('id_jadwal',$jadwal)
			->where('id_detail_jadwal',$detail)
			->orderBy('soal_ke','asc')
			->get();

		return View('siswa.ujian_berlangsung')
			->with('detail',$detailsoal)
			->with('jadwal',$jadwal)
			->with('detailjadwal',$detail)
			->with('detik',$totaldetik);
	}

	public function pilih_soal(Request $request){
		if($request->ajax()){
			$no=$request->input('no');
			$jadwal=$request->input('jadwal');
			$detailjadwal=$request->input('detailjadwal');

			$detailsoal=Soalsiswa::find($no);

			return View('siswa.pilih-soal')
				->with('soal',$detailsoal)
				->with('no',$no);
		}
	}

	public function jawab_soal(Request $request){
		if($request->ajax()){
			$no=$request->input('soal');
			$jawaban=$request->input('jawaban');

			$detailsoal=Soalsiswa::find($no);
			$detailsoal->jawaban=$jawaban;
			$detailsoal->status=1;

			$soal=Detail::find($detailsoal->id_detail_soal);

			if($soal->kunci_jawaban==$jawaban){
				$detailsoal->benar='Y';
			}else{
				$detailsoal->benar='N';
			}

			$detailsoal->save();

			Session::flash('pesan',"Jawaban Berhasil disimpan");
		}
	}

	public function selesai($jadwal,$detailjadwal){
		return View('siswa.selesai')
			->with('jadwal',$jadwal)
			->with('detail',$detailjadwal);
	}

	public function proses_selesai(Request $request){
		$siswa=$this->getSiswa();

		$peserta=Peserta::where('nis',$siswa->nis)->first();

		$jadwal=$request->input('jadwal');
		$detailjadwal=$request->input('detailjadwal');

		DB::table('soal_siswa')
            ->where('id_jadwal',$jadwal)
            ->where('id_detail_jadwal',$detailjadwal)
            ->where('nis',$this->getNis())
            ->update(['selesai' => 'Y']);

        Session::flash('pesan',"Terima Kasih anda telah menyelesaikan ujian");

        return View('siswa.telah_selesai')
        	->with('siswa',$siswa)
        	->with('peserta',$peserta);
	}

	public function waktu_habis(){
		$siswa=$this->getSiswa();

		$peserta=Peserta::where('nis',$siswa->nis)->first();

		$jadwal=Session::get('jadwal');
		$detailjadwal=Session::get('detailjadwal');

		DB::table('soal_siswa')
            ->where('id_jadwal',$jadwal)
            ->where('id_detail_jadwal',$detailjadwal)
            ->where('nis',$this->getNis())
            ->update(['selesai' => 'Y']);

        Session::flash('pesan',"Terima Kasih anda telah menyelesaikan ujian");
        Session::forget('jadwal');
        Session::forget('detailjadwal');

        return View('siswa.telah_selesai')
        	->with('siswa',$siswa)
        	->with('peserta',$peserta);
	}

	public function getSiswa(){
		$siswa=Siswa::find($this->getNis());

		return $siswa;
	}

	public function getNis(){
		return auth()->guard('siswa')->user()->nis;
	}
}