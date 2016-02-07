<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Intervention\Image\Facades\Image;

use App\Http\Requests;

use App\Http\Controllers\Controller;
use App\Models\Guru;
use App\Models\Jadwal;
use App\Models\Jurusan;
use App\Models\Detail;

use Validator,Redirect,Session;

class GuruArea extends Controller{

	public function index(){
		$guru=Guru::find($this->getNip());
		$jadwal=Jadwal::where('kd_mapel',$guru->kd_mapel)->first();
		$detail=Detail::where('id_soal',$guru->soal->id)->get();

		return View('guru.index')
			->with('guru',$guru)
			->with('detail',$detail);
	}

	public function create_soal(){
		$guru=$this->getGuru();
		$jurusan=Jurusan::all();

		return View('guru.create_soal')
			->with('guru',$guru)
			->with('jurusan',$jurusan);
	}

	public function simpan_soal(Request $request){
		$guru=$this->getGuru();

		$rules=['soal'=>'required','kunci'=>'required'];
		$pesan=['soal.required'=>'Soal harus diisi','kunci.required'=>'Kunci Jawaban harus diisi'];

		$validasi=Validator::make($request->all(),$rules,$pesan);

		if($validasi->fails()){
			return Redirect::back()
				->withInput()
				->withErrors($validasi);
		}else{
			$detail=new Detail;
			$detail->id_soal=$guru->soal->id;

			if($request->hasFile('soal')){
				$file=$request->file('soal');
				$filename=str_random(5).'-'.$file->getClientOriginalName();
				$destinationPath='uploads/big/';
				$file->move($destinationPath,$filename);
				$detail->gambar_besar=$filename;
				$detail->gambar_kecil=$filename;

				list($width, $height) = getimagesize($destinationPath.'/'.$filename);

				if( $width > $height){
					$img = Image::make($destinationPath.'/'.$filename)->resize(800, 600)->save('uploads/small/'.$filename);
				}
				else{
					$img = Image::make($destinationPath.'/'.$filename)->resize(600, 800)->save('uploads/small/'.$filename);
				}
			}

			$detail->kunci_jawaban=$request->input('kunci');

			$detail->save();

			Session::flash('pesan',"Soal Berhasil ditambah");
			return Redirect::to('guru');
		}
	}

	public function edit_soal(Request $request,$id){
		$detail=Detail::find($id);

		return View('guru.edit_soal')
			->with('detail',$detail);
	}

	public function update_soal(Request $request){
		$guru=$this->getGuru();

		$rules=['soal'=>'required','kunci'=>'required'];
		$pesan=['soal.required'=>'Soal harus diisi','kunci.required'=>'Kunci Jawaban harus diisi'];

		$validasi=Validator::make($request->all(),$rules,$pesan);

		if($validasi->fails()){
			return Redirect::back()
				->withInput()
				->withErrors($validasi);
		}else{
			$detail=Detail::find($request->input('kode'));
			$detail->id_soal=$guru->soal->id;

			if($request->hasFile('soal')){
				$file=$request->file('soal');
				$filename=str_random(5).'-'.$file->getClientOriginalName();
				$destinationPath='uploads/big/';
				$file->move($destinationPath,$filename);
				$detail->gambar_besar=$filename;
				$detail->gambar_kecil=$filename;

				list($width, $height) = getimagesize($destinationPath.'/'.$filename);

				if( $width > $height){
					$img = Image::make($destinationPath.'/'.$filename)->resize(800, 600)->save('uploads/small/'.$filename);
				}
				else{
					$img = Image::make($destinationPath.'/'.$filename)->resize(600, 800)->save('uploads/small/'.$filename);
				}
			}

			$detail->kunci_jawaban=$request->input('kunci');

			$detail->save();

			Session::flash('pesan',"Soal Berhasil diubah");
			return Redirect::to('guru');
		}
	}

	public function hapus_soal(Request $request){
		if($request->ajax()){
			$kode=$request->input('kode');

			$detail=Detail::find($kode);

			if($detail->gambar_besar){

				\File::delete([
		            public_path().DIRECTORY_SEPARATOR.'uploads/big/'.DIRECTORY_SEPARATOR.$detail->gambar_besar,
		            public_path().DIRECTORY_SEPARATOR.'uploads/small/'.DIRECTORY_SEPARATOR.$detail->gambar_besar
		            //$this->filePath(),
		            //$this->thumbnailPath()
		        ]);
			}

			Session::flash('pesan',"Data Berhasil dihapus");
			$detail->delete();
		}
	}

	public function getGuru(){
		$guru=Guru::find($this->getNip());

		return $guru;
	}

	public function getNip(){
		return auth()->guard('guru')->user()->nip;
	}
}