<?php

/*
|--------------------------------------------------------------------------
| Routes File
|--------------------------------------------------------------------------
|
| Here is where you will register all of the routes in an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/

Route::get('/', function () {
    return view('welcome');
});

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| This route group applies the "web" middleware group to every route
| it contains. The "web" middleware group is defined in your HTTP
| kernel and includes session state, CSRF protection, and more.
|
*/

Route::group(['middleware' => ['web']], function () {
    //
});

Route::group(['prefix'=>'admin','middleware'=>'auth.admin'],function(){
	Route::get('/','AdminController@index');
	Route::get('profile','AdminController@profile');
	Route::post('update-profile','AdminController@update_profile');
	Route::resource('jurusan','JurusanController');
	Route::resource('kelas','KelasController');
	Route::resource('mapel','MapelController');
	Route::resource('ruang','RuangController');
	Route::resource('guru','GuruController');


	Route::resource('siswa','SiswaController');
	Route::get('import-siswa','SiswaController@import');
	Route::post('proses-import-siswa','SiswaController@proses_import');


	Route::resource('soal','SoalController');
	Route::resource('jadwal','JadwalController');
	Route::resource('pengawas','PengawasController');

	Route::get('tambah-soal/{id}','SoalController@tambah_soal');
	Route::post('simpan-soal','SoalController@simpan_soal');
	Route::get('detail-soal/{id}/edit','SoalController@edit_soal');
	Route::post('update-soal','SoalController@proses_edit');
	Route::post('hapus-soal','SoalController@hapus_soal');

	Route::get('tambah-ruang/{id}','JadwalController@tambah_ruang');
	Route::post('simpan-ruang','JadwalController@simpan_ruang');
	Route::get('detail-jadwal/{id}/edit','JadwalController@detail_jadwal');
	Route::post('update-ruang','JadwalController@update_ruang');
	Route::post('hapus-ruang','JadwalController@hapus_ruang');

	//peserta ujian
	Route::get('peserta-ujian','PesertaController@index');
	Route::get('atur-peserta/{id}','PesertaController@atur_peserta');
	Route::get('seting-peserta','PesertaController@setting');
	Route::post('simpan-peserta','PesertaController@simpan_peserta');
	Route::get('get-siswa','PesertaController@get_siswa');
	Route::post('hapus-peserta','PesertaController@hapus_peserta');

	Route::group(['prefix'=>'laporan'],function(){
		//siswa
		Route::get('siswa','LapController@siswa');
		Route::post('preview-siswa','LapController@preview_siswa');
		Route::get('cetak-siswa','LapController@cetak_siswa');

		Route::get('export-siswa','LapController@export_siswa');
		Route::get('preview-cetak-siswa','LapController@preview_cetak_siswa');
		Route::get('export-siswa-pdf','LapController@export_siswa_pdf');

		//guru
		Route::get('guru','LapController@guru');
		Route::get('cetak-guru','LapController@cetak_guru');

		//nilai
		Route::get('nilai','LapController@nilai');
		Route::post('preview-nilai','LapController@preview_nilai');
		Route::get('cetak-nilai','LapController@cetak_nilai');
		Route::get('detail-nilai/{id}','LapController@detail_nilai');

		//peserta
		Route::get('peserta','LapController@peserta');
		Route::post('preview-peserta','LapController@preview_peserta');
		Route::get('cetak-peserta','LapController@cetak_peserta');

		//jadwal
		Route::get('jadwal','LapController@jadwal');
		Route::get('cetak-jadwal','LapController@cetak_jadwal');

		//kartu peserta
		Route::get('kartu-peserta','LapController@kartu_peserta');
		Route::post('preview-kartu-peserta','LapController@preview_kartu_peserta');
		Route::get('cetak-kartu-peserta','LapController@cetak_kartu_peserta');
	});
});

//siswa area
Route::group(['prefix'=>'siswa','middleware'=>'auth.siswa'],function(){
	Route::get('/','SiswaArea@index');
	Route::get('lihat-ujian','SiswaArea@lihat_ujian');
	Route::post('lihat-ujian','SiswaArea@proses_lihat_ujian');
	Route::post('ujian-berlangsung','SiswaArea@ujian_berlangsung');
	Route::get('ujian-berlangsung/{jadwal}/{detail}','SiswaArea@sedang_ujian');
	Route::get('pilih-soal','SiswaArea@pilih_soal');
	Route::post('jawab-soal','SiswaArea@jawab_soal');
	Route::get('selesai/{jadwal}/{detailjadwal}','SiswaArea@selesai');
	Route::post('telah-selesai','SiswaArea@proses_selesai');
	Route::get('waktu-habis','SiswaArea@waktu_habis');
});
//end siswa area

//pengawas area
Route::group(['prefix'=>'pengawas','middleware'=>'auth.pengawas'],function(){
	Route::get('/','PengawasArea@index');
	Route::get('load-siswa','PengawasArea@load_siswa');
	Route::post('get-token','PengawasArea@get_token');
});
//end pengawas area

//guru area
Route::group(['prefix'=>'guru','middleware'=>'auth.guru'],function(){
	Route::auth();

	Route::get('/','GuruArea@index');
	Route::get('create-soal','GuruArea@create_soal');
	Route::post('simpan-soal','GuruArea@simpan_soal');
	Route::get('edit/{id}','GuruArea@edit_soal');
	Route::post('update-soal','GuruArea@update_soal');
	Route::post('hapus-soal','GuruArea@hapus_soal');
});
//end guru area

Route::group(array('prefix'=>'login'),function(){
	Route::get('admin','Auth\AuthController@admin');
	Route::post('proses-admin','Auth\AuthController@proses_admin');

	Route::get('siswa','Auth\AuthController@siswa');
	Route::post('proses-siswa','Auth\AuthController@proses_siswa');
	
	Route::get('pengawas','Auth\AuthController@pengawas');
	Route::post('proses-pengawas','Auth\AuthController@proses_pengawas');

	Route::get('guru','Auth\AuthController@guru');
	Route::post('proses-guru','Auth\AuthController@proses_guru');

	Route::get('logout','Auth\AuthController@logout');
	Route::get('logout-siswa','Auth\AuthController@logout_siswa');
	Route::get('logout-guru','Auth\AuthController@logout_guru');
	Route::get('logout-pengawas','Auth\AuthController@logout_pengawas');
});

Route::group(['prefix'=>'api'],function(){
	Route::get('siswa','ApiController@siswa');
	Route::get('tes','ApiController@tes');
	Route::get('acak','ApiController@acak');
	Route::get('random',function(){
		echo mt_rand().'@';
	});
});