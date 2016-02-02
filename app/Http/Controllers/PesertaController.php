<?php
namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Ruang;
use App\Models\Peserta;
use App\Models\Kelas;

use Redirect,Session;

class PesertaController extends Controller{
    public function index(){
        $ruang=Ruang::all();

        return View('admin.peserta.index')
            ->with('ruang',$ruang);
    }

    public function atur_peserta($id){
        $ruang=Ruang::find($id);
        $peserta=Peserta::where('id_ruang',$id)->get();

        return View('admin.peserta.atur_peserta')
            ->with('ruang',$ruang)
            ->with('peserta',$peserta);
    }

    public function setting(){
        $ruang=Ruang::all();
        $kelas=Kelas::all();

        return View('admin.peserta.setting')
            ->with('ruang',$ruang)
            ->with('kelas',$kelas);
    }

    public function simpan_peserta(){
        Session::flash('pesan',"Setting Peserta Berhasil");
        return Redirect::to('admin/atur-peserta/1');
    }

    public function get_siswa(){
        return View('admin.peserta.get_siswa');
    }
}