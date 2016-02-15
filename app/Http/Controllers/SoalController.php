<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\Models\Soal;
use App\Models\Jurusan;
use App\Models\Mapel;
use App\Models\Detail;
use Redirect,Validator,Session,DB;

class SoalController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $soal=Soal::all();
        return View('admin.soal.index')
            ->with('soal',$soal);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $jurusan=Jurusan::all();
        $mapel=Mapel::all();

        return View('admin.soal.create')
            ->with('jurusan',$jurusan)
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
        $validasi=Validator::make($request->all(),Soal::$rules,Soal::$pesan);

        if($validasi->fails()){
            return Redirect::back()
                ->withInput()
                ->withErrors($validasi);
        }else{
            $soal=new Soal;
            $soal->kd_mapel=$request->input('mapel');
            $soal->kode_jurusan=$request->input('jurusan');
            $soal->waktu_ujian=$request->input('waktu');
            $soal->save();

            Session::flash('pesan',"Data Berhasil disimpan");
            return Redirect::to('admin/soal/'.$soal->id);
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
        $soal=Soal::find($id);
        $detail=Detail::where('id_soal',$id)->get();

        return View('admin.soal.detail')
            ->with('soal',$soal)
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
        $jurusan=Jurusan::all();
        $soal=Soal::find($id);
        $mapel=Mapel::all();

        return View('admin.soal.edit')
            ->with('jurusan',$jurusan)
            ->with('mapel',$mapel)
            ->with('soal',$soal);
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
        $validasi=Validator::make($request->all(),Soal::$rules,Soal::$pesan);

        if($validasi->fails()){
            return Redirect::back()
                ->withInput()
                ->withErrors($validasi);
        }else{
            $soal=Soal::find($id);
            $soal->kd_mapel=$request->input('mapel');
            $soal->kode_jurusan=$request->input('jurusan');
            $soal->waktu_ujian=$request->input('waktu');
            $soal->save();

            Session::flash('pesan',"Data Berhasil diupdate");
            return Redirect::to('admin/soal/'.$soal->id);
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
        $soal=Soal::find($id);

        $detail=DB::table('detail_soal')
            ->where('id_soal',$id)
            ->count();

        if($detail>0){
            Session::flash('pesan',"Data Soal tidak dapat dihapus");
            return Redirect::back();   
        }

        $soal->delete();

        Session::flash('pesan',"Data berhasil dihapus");

        return Redirect::to('admin/soal');
    }

    public function tambah_soal($id){
        $soal=Soal::find($id);

        return View('admin.soal.tambah-soal')
            ->with('soal',$soal);
    }

    public function simpan_soal(Request $request){
        $rules=[
            'soal'=>'required',
            'pertanyaan'=>'required',
            'jawabana'=>'required',
            'jawabanb'=>'required',
            'jawabanc'=>'required',
            'jawaband'=>'required',
            'jawabane'=>'required',
            'kunci'=>'required'
        ];

        $pesan=[
            'soal.required'=>'Soal harus diisi',
            'pertanyaan.required'=>'Pertanyaan harus diisi',
            'jawabana.required'=>'Jawaban A harus diisi',
            'jawabanb.required'=>'Jawaban B harus diisi',
            'jawabanc.required'=>'Jawaban C harus diisi',
            'jawaband.required'=>'Jawaban D harus diisi',
            'jawabane.required'=>'Jawaban E harus diisi'
        ];

        $validasi=Validator::make($request->all(),$rules,$pesan);

        if($validasi->fails()){
            return Redirect::back()
                ->withInput()
                ->withErrors($validasi);
        }else{
            $detail=new Detail;
            $detail->id_soal=$request->input('soal');
            $detail->pertanyaan=$request->input('pertanyaan');
            $detail->jawaban_a=$request->input('jawabana');
            $detail->jawaban_b=$request->input('jawabanb');
            $detail->jawaban_c=$request->input('jawabanc');
            $detail->jawaban_d=$request->input('jawaband');
            $detail->jawaban_e=$request->input('jawabane');
            $detail->kunci_jawaban=$request->input('kunci');
            $detail->save();

            Session::flash('pesan',"Data Berhasil disimpan");
            return Redirect::back();
        }
    }

    public function edit_soal($id){
        $detail=Detail::find($id);

        return View('admin.soal.edit_soal')
            ->with('detail',$detail);
    }

    public function proses_edit(Request $request){
        $id=$request->input('kode');
        
        $rules=[
            'pertanyaan'=>'required',
            'jawabana'=>'required',
            'jawabanb'=>'required',
            'jawabanc'=>'required',
            'jawaband'=>'required',
            'jawabane'=>'required',
            'kunci'=>'required'
        ];

        $pesan=[
            'pertanyaan.required'=>'Pertanyaan harus diisi',
            'jawabana.required'=>'Jawaban A harus diisi',
            'jawabanb.required'=>'Jawaban B harus diisi',
            'jawabanc.required'=>'Jawaban C harus diisi',
            'jawaband.required'=>'Jawaban D harus diisi',
            'jawabane.required'=>'Jawaban E harus diisi'
        ];

        $validasi=Validator::make($request->all(),$rules,$pesan);

        if($validasi->fails()){
            return Redirect::back()
                ->withInput()
                ->withErrors($validasi);
        }else{
            $detail=Detail::find($id);
            $detail->pertanyaan=$request->input('pertanyaan');
            $detail->jawaban_a=$request->input('jawabana');
            $detail->jawaban_b=$request->input('jawabanb');
            $detail->jawaban_c=$request->input('jawabanc');
            $detail->jawaban_d=$request->input('jawaband');
            $detail->jawaban_e=$request->input('jawabane');
            $detail->kunci_jawaban=$request->input('kunci');
            $detail->save();

            Session::flash('pesan',"Data Berhasil disimpan");
            return Redirect::back();
        }
    }

    public function hapus_soal(Request $request){
        if($request->ajax()){
            $kode=$request->input('kode');

            $detail=Detail::find($kode)->delete();

            Session::flash('pesan','Data Berhasil dihapus');
        }
    }
}
