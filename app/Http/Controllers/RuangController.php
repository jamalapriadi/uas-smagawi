<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\Models\Ruang;
use Redirect,Validator,Session;

class RuangController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $ruang=Ruang::all();
        return View('admin.ruang.index')
            ->with('ruang',$ruang);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return View('admin.ruang.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validasi=Validator::make($request->all(),Ruang::$rules,Ruang::$pesan);

        if($validasi->fails()){
            return Redirect::back()
                ->withInput()
                ->withErrors($validasi);
        }else{
            $ruang=new Ruang;
            $ruang->nama_ruang=$request->input('nama');
            $ruang->kuota=$request->input('kuota');
            $ruang->save();

            Session::flash('pesan',"Data Berhasil disimpan");
            return Redirect::to('admin/ruang');
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
        $ruang=Ruang::find($id);

        return View('admin.ruang.edit')
            ->with('ruang',$ruang);
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
        $validasi=Validator::make($request->all(),Ruang::$rules,Ruang::$pesan);

        if($validasi->fails()){
            return Redirect::back()
                ->withInput()
                ->withErrors($validasi);
        }else{
            $ruang=Ruang::find($id);
            $ruang->nama_ruang=$request->input('nama');
            $ruang->kuota=$request->input('kuota');
            $ruang->save();

            Session::flash('pesan',"Data Berhasil diupdate");
            return Redirect::to('admin/ruang');
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
        $ruang=Ruang::find($id);

        $ruang->delete();

        Session::flash('pesan',"Data Berhasil dihapus");

        return Redirect::to('admin/ruang');
    }
}
