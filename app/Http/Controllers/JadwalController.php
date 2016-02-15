<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\Models\Jadwal;
use App\Models\Djadwal;
use App\Models\Kelas;
use App\Models\Ruang;
use App\Models\Mapel;
use App\Models\Pengawas;
use App\Models\Jurusan;

use Redirect,Session,Validator,DB;
use Ramsey\Uuid\Uuid;

class JadwalController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $jadwal=Jadwal::all();

        return View('admin.jadwal.index')
            ->with('jadwal',$jadwal);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $mapel=Mapel::all();
        $jurusan=Jurusan::all();

        return View('admin.jadwal.create')
            ->with('mapel',$mapel)
            ->with('jurusan',$jurusan);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validasi=Validator::make($request->all(),Jadwal::$rules,Jadwal::$pesan);

        if($validasi->fails()){
            return Redirect::back()
                ->withInput()
                ->withErrors($validasi);
        }else{
            $jadwal=new Jadwal;
            $jadwal->id_jadwal=Uuid::uuid4()->getHex();
            $jadwal->kode_jurusan=$request->input('jurusan');
            $jadwal->kd_mapel=$request->input('mapel');
            $jadwal->tgl_ujian=date('Y-m-d',strtotime($request->input('tanggal')));
            $jadwal->jam=date('H:i:s',strtotime($request->input('jam')));
            $jadwal->selesai=date('H:i:s',strtotime($request->input('selesai')));
            $jadwal->waktu_ujian=$request->input('lama');
            $jadwal->save();

            Session::flash('pesan',"Data Berhasil disimpan");
            return Redirect::to('admin/jadwal/'.$jadwal->id);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $jadwal=Jadwal::find($id);
        $detail=Djadwal::where('id_jadwal',$id)
            ->get();

        return View('admin.jadwal.detail')
            ->with('jadwal',$jadwal)
            ->with('detail',$detail);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $jadwal=Jadwal::find($id);
        $mapel=Mapel::all();
        $jurusan=Jurusan::all();

        return View('admin.jadwal.edit')
            ->with('jadwal',$jadwal)
            ->with('mapel',$mapel)
            ->with('jurusan',$jurusan);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $validasi=Validator::make($request->all(),Jadwal::$rules,Jadwal::$pesan);

        if($validasi->fails()){
            return Redirect::back()
                ->withInput()
                ->withErrors($validasi);
        }else{
            $jadwal=Jadwal::find($id);
            $jadwal->kd_mapel=$request->input('mapel');
            $jadwal->kode_jurusan=$request->input('jurusan');
            $jadwal->tgl_ujian=date('Y-m-d',strtotime($request->input('tanggal')));
            $jadwal->jam=date('H:i:s',strtotime($request->input('jam')));
            $jadwal->selesai=date('H:i:s',strtotime($request->input('selesai')));
            $jadwal->waktu_ujian=$request->input('lama');
            $jadwal->save();

            Session::flash('pesan',"Data Berhasil disimpan");
            return Redirect::to('admin/jadwal/'.$jadwal->id);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $jadwal=Jadwal::find($id);

        //cek detail_jadwal
        $detail=DB::table('detail_jadwal')
            ->where('id_jadwal',$id)
            ->count();

        if($detail>0){
            Session::flash('pesan',"Data tidak dapat dihapus karena ada data jadwal yang masih menggunakan kelas ini");
            return Redirect::back();   
        }

        $jadwal->delete();

        Session::flash('pesan',"Data Berhasil dihapus");

        return Redirect::to('admin/jadwal');
    }

    public function tambah_ruang($id){
        $jadwal=Jadwal::find($id);
        $kelas=Kelas::where('kode_jurusan',$jadwal->kode_jurusan)->get();
        
        //$ruang=DB::select("select * from ruang_ujian where id_ruang not in(select detail_jadwal.id_ruang from detail_jadwal
          //  where id_jadwal='$id' and ruang_ujian.id_ruang=detail_jadwal.id_ruang)");
        $ruang=DB::select("select * from ruang_ujian where ruang_ujian.id_ruang not in(
                select view_detail_jadwal.id_ruang from view_detail_jadwal where view_detail_jadwal.id_ruang=ruang_ujian.id_ruang
                and view_detail_jadwal.tgl_ujian='$jadwal->tgl_ujian'
                and view_detail_jadwal.jam >= '$jadwal->jam'
                and view_detail_jadwal.selesai <= '$jadwal->selesai')");

        $pengawas=DB::select("select * from pengawas where pengawas.nip not in(
                select view_detail_jadwal.pengawas from view_detail_jadwal where view_detail_jadwal.pengawas=pengawas.nip
                and view_detail_jadwal.tgl_ujian='$jadwal->tgl_ujian'
                and view_detail_jadwal.jam >= '$jadwal->jam'
                and view_detail_jadwal.selesai <= '$jadwal->selesai')");

        return View('admin.jadwal.tambah_ruang')
            ->with('kelas',$kelas)
            ->with('ruang',$ruang)
            ->with('pengawas',$pengawas)
            ->with('jadwal',$jadwal);
    }

    public function simpan_ruang(Request $request){
        $rules=[
            'kelas'=>'required',
            'ruang'=>'required',
            'pengawas'=>'required'
        ];

        $pesan=[
            'kelas.required'=>'Kelas harus diisi',
            'ruang.required'=>'Ruang Ujian harus diisi',
            'pengawas.required'=>'Pengawas harus diisi'
        ];

        $validasi=Validator::make($request->all(),$rules,$pesan);

        if($validasi->fails()){
            return Redirect::back()
                ->withInput()
                ->withErrors($validasi);
        }else{
            //cek dulu apakah ruangan ini sudah digunakan pada jam ini atau belum
            /*
            $ruangan=$request->input('ruang');

            $jadwal=Jadwal::find($request->input('kode'));

            $cek=DB::select("select a.*,b.tgl_ujian,b.jam,b.selesai from detail_jadwal a,
            jadwal b where a.id_jadwal=b.id_jadwal
            and a.id_ruang='$ruangan' and b.jam >= '$jadwal->jam' and b.selesai <= '$jadwal->selesai'");
            */

            $djadwal=new Djadwal;
            $djadwal->id=Uuid::uuid4()->getHex();
            $djadwal->id_jadwal=$request->input('kode');
            $djadwal->kd_kelas=$request->input('kelas');
            $djadwal->id_ruang=$request->input('ruang');
            $djadwal->pengawas=$request->input('pengawas');
            $djadwal->status=0;
            $djadwal->save();

            Session::flash('pesan','Data Berhasil disimpan');
            return Redirect::back();
        }
    }

    public function detail_jadwal($id){
        $djadwal=Djadwal::find($id);
        $kelas=Kelas::all();
        $ruang=Ruang::all();
        $pengawas=Pengawas::all();

        return View('admin.jadwal.detail_jadwal')
            ->with('jadwal',$djadwal)
            ->with('kelas',$kelas)
            ->with('ruang',$ruang)
            ->with('pengawas',$pengawas);
    }

    public function update_ruang(Request $request){
        $rules=[
            'kelas'=>'required',
            'ruang'=>'required',
            'pengawas'=>'required'
        ];

        $pesan=[
            'kelas.required'=>'Kelas harus diisi',
            'ruang.required'=>'Ruang Ujian harus diisi',
            'pengawas.required'=>'Pengawas harus diisi'
        ];

        $validasi=Validator::make($request->all(),$rules,$pesan);

        if($validasi->fails()){
            return Redirect::back()
                ->withInput()
                ->withErrors($validasi);
        }else{
            $djadwal=Djadwal::find($request->input('kode'));
            $djadwal->kd_kelas=$request->input('kelas');
            $djadwal->id_ruang=$request->input('ruang');
            $djadwal->pengawas=$request->input('pengawas');
            $djadwal->status=0;
            $djadwal->save();

            Session::flash('pesan','Data Berhasil disimpan');
            return Redirect::back();
        }
    }

    public function hapus_ruang(Request $request){
        if($request->ajax()){
            $kode=$request->input('kode');

            $djadwal=Djadwal::find($kode);

            $djadwal->delete();

            Session::flash('pesan',"Data Berhasil dihapus");
        }
    }
}
