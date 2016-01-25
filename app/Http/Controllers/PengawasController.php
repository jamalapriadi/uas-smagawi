<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\Models\Pengawas;
use Redirect,Session,Validator,Hash;

class PengawasController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $pengawas=Pengawas::all();

        return View('admin.pengawas.index')
            ->with('pengawas',$pengawas);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return View('admin.pengawas.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validasi=Validator::make($request->all(),Pengawas::$rules,Pengawas::$pesan);

        if($validasi->fails()){
            return Redirect::back()
                ->withInput()
                ->withErrors($validasi);
        }else{
            $pengawas=new Pengawas;
            $pengawas->nip=$request->input('nip');
            $pengawas->nama=$request->input('nama');
            $pengawas->password=Hash::make($request->input('password'));
            $pengawas->save();

            Session::flash('pesan','Data Berhasil disimpan');

            return Redirect::to('admin/pengawas');
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
        $pengawas=Pengawas::find($id);

        return View('admin.pengawas.detail')
            ->with('pengawas',$pengawas);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $pengawas=Pengawas::find($id);

        return View('admin.pengawas.edit')
            ->with('pengawas',$pengawas);
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
        $pengawas=Pengawas::find($id);

        $rules=[
            'nip'=>'required',
            'nama'=>'required'
        ];

        $validasi=Validator::make($request->all(),$rules,Pengawas::$pesan);

        if($validasi->fails()){
            return Redirect::back()
                ->withInput()
                ->withErrors($validasi);
        }else{
            $pengawas->nama=$request->input('nama');
            $pengawas->save();

            Session::flash('pesan','Data Berhasil diupdate');

            return Redirect::to('admin/pengawas');
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
        $pengawas=Pengawas::find($id);

        $pengawas->delete();

        Session::flash('pesan',"Data Berhasil dihapus");

        return Redirect::back();
    }
}
