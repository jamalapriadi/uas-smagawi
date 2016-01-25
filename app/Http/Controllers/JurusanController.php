<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\Models\Jurusan;
use App\Models\Kelas;
use Validator,Input,Redirect,Session;

class JurusanController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $jurusan=Jurusan::all();

        return View('admin.jurusan.index')
            ->with('jurusan',$jurusan);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return View('admin.jurusan.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validasi=Validator::make($request->all(),Jurusan::$rulesbaru,Jurusan::$pesan);

        if($validasi->fails()){
            return Redirect::back()
                ->withInput()
                ->withErrors($validasi);
        }else{
            $jurusan=new Jurusan;
            $jurusan->kode_jurusan=$request->input('kode');
            $jurusan->nama_jurusan=$request->input('nama');
            $jurusan->save();

            $html="Data Berhasil disimpan";

            Session::flash('pesan',$html);
            return Redirect::to('admin/jurusan');
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
        $jurusan=Jurusan::find($id);

        return View('admin.jurusan.edit')
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
        $jurusan=Jurusan::find($id);

        $validasi=Validator::make($request->all(),Jurusan::$rules,Jurusan::$pesan);

        if($validasi->fails()){
            return Redirect::back()
                ->withInput()
                ->withErrors($validasi);
        }else{
            $jurusan->kode_jurusan=$request->input('kode');
            $jurusan->nama_jurusan=$request->input('nama');
            $jurusan->save();

            $html="Data Berhasil diupdate";

            Session::flash('pesan',$html);
            return Redirect::to('admin/jurusan');
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
        $jurusan=Jurusan::find($id);

        $kelas=Kelas::where('kode_jurusan',$id)->count();

        if($kelas>0){
            $html="Data Tidak dapat dihapus";
        }else{
            $html="Data berhasil dihapus";
            $jurusan->delete();
        }

        Session::flash('pesan',$html);
        return Redirect::to('admin/jurusan');
    }
}
