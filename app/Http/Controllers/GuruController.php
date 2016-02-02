<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\Models\Guru;
use App\Models\Mapel;
use App\Models\Jurusan;
use App\Models\Soal;
use Redirect,Validator,Session,Hash;

class GuruController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $guru=Guru::all();

        return View('admin.guru.index')
            ->with('guru',$guru);
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

        return View('admin.guru.create')
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
        $validasi=Validator::make($request->all(),Guru::$rules,Guru::$pesan);

        if($validasi->fails()){
            return Redirect::back()
                ->withInput()
                ->withErrors($validasi);
        }else{
            $guru=new Guru;
            $guru->nip=$request->input('nip');
            $guru->nama=$request->input('nama');
            $guru->password=Hash::make($request->input('password'));
            $guru->kd_mapel=$request->input('mapel');
            $simpan=$guru->save();

            if($simpan){
                $soal=new Soal;
                $soal->kd_mapel=$request->input('mapel');
                $soal->kode_jurusan=$request->input('jurusan');
                $soal->author=$request->input('nip');
                $soal->save();
            }

            Session::flash('pesan',"Data Berhasil disimpan");
            return Redirect::to('admin/guru');
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
        $guru=Guru::find($id);
        $mapel=Mapel::all();
        $jurusan=Jurusan::all();

        return View('admin.guru.edit')
            ->with('guru',$guru)
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
        $validasi=Validator::make($request->all(),Guru::$rulesupdate,Guru::$pesan);

        if($validasi->fails()){
            return Redirect::back()
                ->withInput()
                ->withErrors($validasi);
        }else{
            $guru=Guru::find($id);
            $guru->nama=$request->input('nama');
            $guru->kd_mapel=$request->input('mapel');
            $update=$guru->save();

            if($update){
                $soal=Soal::find($request->input('soal'));
                $soal->kd_mapel=$request->input('mapel');
                $soal->kode_jurusan=$request->input('jurusan');
                $soal->author=$request->input('nip');
                $soal->save();
            }

            Session::flash('pesan',"Data Berhasil diupdate");
            return Redirect::to('admin/guru');
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
        $guru=Guru::find($id);

        $guru->delete();

        Session::flash('pesan',"Data berhasil dihapus");

        return Redirect::to('admin/guru');
    }
}
