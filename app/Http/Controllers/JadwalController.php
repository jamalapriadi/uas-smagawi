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

use Redirect,Session,Validator,DB;

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

        return View('admin.jadwal.create')
            ->with('mapel',$mapel);
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
            $jadwal->kd_mapel=$request->input('mapel');
            $jadwal->tgl_ujian=date('Y-m-d',strtotime($request->input('tanggal')));
            $jadwal->jam=date('H:i:s',strtotime($request->input('jam')));
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

        return View('admin.jadwal.edit')
            ->with('jadwal',$jadwal)
            ->with('mapel',$mapel);
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
            $jadwal->tgl_ujian=date('Y-m-d',strtotime($request->input('tanggal')));
            $jadwal->jam=date('H:i:s',strtotime($request->input('jam')));
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

        $jadwal->delete();

        Session::flash('pesan',"Data Berhasil dihapus");

        return Redirect::to('admin/jadwal');
    }

    public function tambah_ruang($id){
        $jadwal=Jadwal::find($id);
        $kelas=Kelas::all();
        $ruang=Ruang::all();
        $pengawas=Pengawas::all();

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
            $djadwal=new Djadwal;
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
