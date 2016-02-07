<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\Models\Jurusan;
use App\Models\Kelas;

use Validator,Redirect,Input,Session;

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
            $kelas=new Kelas;
            $kelas->kd_kelas=$request->input('rombel');
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
            $kelas->kd_kelas=$request->input('rombel');
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

        $kelas->delete();

        Session::flash('pesan',"Data Berhasil dihapus");
        return Redirect::to('admin/kelas');
    }
}
