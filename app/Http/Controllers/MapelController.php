<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\Models\Mapel;

use Redirect,Validator,Session;

class MapelController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $mapel=Mapel::all();
        return View('admin.mapel.index')
            ->with('mapel',$mapel);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return View('admin.mapel.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validasi=Validator::make($request->all(),Mapel::$rules,Mapel::$pesan);

        if($validasi->fails()){
            return Redirect::back()
                ->withInput()
                ->withErrors($validasi);
        }else{
            $mapel=new Mapel;
            $mapel->kd_mapel=$request->input('kode');
            $mapel->nm_mapel=$request->input('nama');
            $mapel->save();

            Session::flash('pesan',"Data Berhasil disimpan");
            return Redirect::to('admin/mapel');
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
        $mapel=Mapel::find($id);
        return View('admin.mapel.edit')
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
        $validasi=Validator::make($request->all(),Mapel::$rules,Mapel::$pesan);

        if($validasi->fails()){
            return Redirect::back()
                ->withInput()
                ->withErrors($validasi);
        }else{
            $mapel=Mapel::find($id);
            $mapel->kd_mapel=$request->input('kode');
            $mapel->nm_mapel=$request->input('nama');
            $mapel->save();

            Session::flash('pesan',"Data Berhasil disimpan");
            return Redirect::to('admin/mapel');
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
        $mapel=Mapel::find($id);

        $mapel->delete();

        Session::flash('pesan',"Data berhasil dihapus");
        return Redirect::to('admin/mapel');
    }
}
