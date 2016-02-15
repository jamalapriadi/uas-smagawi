<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\Models\Jurusan;
use App\Models\Kelas;
use App\Models\Siswa;

use Validator,Redirect,Input,Session,DB;

class KelasController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $kelas=Kelas::all();
        return View('admin.kelas.index')
            ->with('kelas',$kelas);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $jurusan=Jurusan::all();

        return View('admin.kelas.create')
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
        $validasi=Validator::make($request->all(),Kelas::$rulesbaru,Kelas::$pesan);

        if($validasi->fails()){
            return Redirect::back()
                ->withInput()
                ->WithErrors($validasi);
        }else{
            $kode=$request->input('kode').'-'.$request->input('jurusan').'-'.$request->input('sub');

            $cek=Kelas::where('kd_kelas',$kode)->count();

            if($cek>0){
                Session::flash('pesan',"Kode kelas sudah digunakan");
                return Redirect::back();
            }

            $kelas=new Kelas;
            $kelas->kd_kelas=$request->input('kode').'-'.$request->input('jurusan').'-'.$request->input('sub');
            $kelas->kelas=$request->input('kode');
            $kelas->kode_jurusan=$request->input('jurusan');
            $kelas->sub_kelas=$request->input('sub');
            $kelas->save();

            Session::flash('pesan',"Data Berhasil disimpan");
            return Redirect::to('admin/kelas');
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
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $kelas=Kelas::find($id);
        $jurusan=Jurusan::all();

        return View('admin.kelas.edit')
            ->with('kelas',$kelas)
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
        $kelas=Kelas::find($id);

        $validasi=Validator::make($request->all(),Kelas::$rulesbaru,Kelas::$pesan);

        if($validasi->fails()){
            return Redirect::back()
                ->withInput()
                ->WithErrors($validasi);
        }else{
            //$kelas->kd_kelas=$request->input('kode').'-'.$request->input('jurusan').'-'.$request->input('sub');
            $kelas->kelas=$request->input('kode');
            $kelas->kode_jurusan=$request->input('jurusan');
            $kelas->sub_kelas=$request->input('sub');
            $kelas->save();

            Session::flash('pesan',"Data Berhasil disimpan");
            return Redirect::to('admin/kelas');
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
        $kelas=Kelas::find($id);

        //cek siswa dengan kelas ini
        $siswa=Siswa::where('kd_kelas',$id)->count();
        if($siswa>0){
            Session::flash('pesan',"Data tidak dapat dihapus karena ada siswa yang masih menggunakan kelas ini");
            return Redirect::back();
        }

        //cek detail_jadwal
        $detail=DB::table('detail_jadwal')
            ->where('kd_kelas',$id)
            ->count();

        if($detail>0){
            Session::flash('pesan',"Data tidak dapat dihapus karena ada data jadwal yang masih menggunakan kelas ini");
            return Redirect::back();   
        }

        $kelas->delete();

        Session::flash('pesan',"Data Berhasil dihapus");
        return Redirect::to('admin/kelas');
    }
}
