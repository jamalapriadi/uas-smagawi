<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;

use App\Http\Controllers\Controller;
use App\Models\Ruang;
use App\Models\Peserta;
use App\Models\Kelas;
use App\Models\Siswa;

use Redirect,Session,DB;

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

    public function simpan_peserta(Request $request){
        $kelas=$request->input('kelas');
        $ruang=$request->input('ruang');
        $sesi=$request->input('sesi');

        $kuota=Ruang::find($ruang);

        $siswaInpeserta=DB::select("select * from view_peserta_ujian 
            where id_ruang='$ruang' and kd_kelas='$kelas'");

        //jika kuota di ruang ujian ini lebih dari siswa yang sudah ada
        if(count($siswaInpeserta)<=$kuota->kouta){
            //masih bisa ditambahkan
            if($request->has('nis')){
                $nis=$request->input('nis');

                foreach ($nis as $key => $value) {
                    $peserta=array(
                        'nis'=>$value,
                        'id_ruang'=>$ruang,
                        'no_meja'=>count($siswaInpeserta)+1
                    );

                    DB::table('peserta_ujian')->insert($peserta);
                }
            }

            Session::flash('pesan',"Data Berhasil disimpan");

            return Redirect::to('admin/atur-peserta/'.$ruang);
        }else{
            Session::flash('pesan',"Data Gagal disimpan");
        }
        // return Redirect::to('admin/atur-peserta/1');
    }

    public function get_siswa(Request $request){
        if($request->ajax()){
            $kelas=$request->input('kelas');
            $ruang=$request->input('ruang');
            $sesi=$request->input('sesi');

            /*
            $siswa=Siswa::whereNotIn('siswa.nis',function($query){
                    $query->select(DB::raw(1))
                        ->from('peserta_ujian')
                        ->whereRaw('peserta_ujian.nis=siswa.nis');
                })
                ->where('kd_kelas',$kelas)->get();
            */
            $siswa=DB::select("select * from siswa where
                nis not in(select peserta_ujian.nis from peserta_ujian where
                    peserta_ujian.nis=siswa.nis and peserta_ujian.sesi='$sesi')
                    and kd_kelas='$kelas'");

            if(count($siswa)>0){
                return View('admin.peserta.get_siswa')
                    ->with('siswa',$siswa)
                    ->with('kelas',$kelas)
                    ->with('ruang',$ruang)
                    ->with('sesi',$sesi);
            }else{
                echo "<div class='alert alert-info'>Data Tidak Ditemukan</div>";
            }
        }
    }

    public function hapus_peserta(Request $request){
        if($request->ajax()){
            $kode=$request->input('kode');

            Peserta::find($kode)->delete();

            Session::flash('pesan',"Data Peserta berhasil dihapus");
        }
    }
}