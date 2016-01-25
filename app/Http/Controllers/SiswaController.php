<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\Models\Siswa;
use App\Models\Kelas;
use Redirect,Validator,Session,Hash;

class SiswaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $siswa=Siswa::all();

        return View('admin.siswa.index')
            ->with('siswa',$siswa);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $kelas=Kelas::all();

        return View('admin.siswa.create')
            ->with('kelas',$kelas);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validasi=Validator::make($request->all(),Siswa::$rules,Siswa::$pesan);

        if($validasi->fails()){
            return Redirect::back()
                ->withInput()
                ->withErrors($validasi);
        }else{
            $siswa=new Siswa;
            $siswa->nis=$request->input('nis');
            $siswa->nisn=$request->input('nisn');
            $siswa->nama=$request->input('nama');
            $siswa->kd_kelas=$request->input('kelas');
            $siswa->password=Hash::make($request->input('password'));
            $siswa->save();

            Session::flash('pesan',"Data Berhasil disimpan");
            return Redirect::to('admin/siswa');
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
        $siswa=Siswa::find($id);
        $kelas=Kelas::all();

        return View('admin.siswa.edit')
            ->with('siswa',$siswa)
            ->with('kelas',$kelas);
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
        $validasi=Validator::make($request->all(),Siswa::$rulesupdate,Siswa::$pesan);

        if($validasi->fails()){
            return Redirect::back()
                ->withInput()
                ->withErrors($validasi);
        }else{
            $siswa=Siswa::find($id);
            $siswa->nisn=$request->input('nisn');
            $siswa->nama=$request->input('nama');
            $siswa->kd_kelas=$request->input('kelas');
            $siswa->save();

            Session::flash('pesan',"Data Berhasil disimpan");
            return Redirect::to('admin/siswa');
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
        $siswa=Siswa::find($id);

        $siswa->delete();

        Session::flash('pesan',"Data berhasil dihapus");

        return Redirect::to('admin/siswa');
    }
}
