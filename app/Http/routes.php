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
	Route::resource('jurusan','JurusanController');
	Route::resource('kelas','KelasController');
	Route::resource('mapel','MapelController');
	Route::resource('ruang','RuangController');
	Route::resource('guru','GuruController');
	Route::resource('siswa','SiswaController');
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
});

//siswa area
Route::group(['prefix'=>'siswa','middleware'=>'auth.siswa'],function(){
	Route::get('/','SiswaArea@index');
});
//end siswa area

//pengawas area
Route::group(['prefix'=>'pengawas','middleware'=>'auth.pengawas'],function(){
	Route::get('/','PengawasArea@index');
});
//end pengawas area

//guru area
Route::group(['prefix'=>'guru','middleware'=>'auth.guru'],function(){
	Route::get('/','GuruArea@index');
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
