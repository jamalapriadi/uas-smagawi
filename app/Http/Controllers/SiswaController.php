<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Maatwebsite\Excel\Facades\Excel;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\Models\Siswa;
use App\Models\Kelas;
use Redirect,Validator,Session,Hash,DB;

class SiswaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $siswa=Siswa::orderBy('no_peserta','desc')->get();

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
            $siswa->nama=$request->input('nama');
            $siswa->jk=$request->input('jk');
            $siswa->tmp_lahir=$request->input('tempat');
            $siswa->tgl_lahir=date('Y-m-d',strtotime($request->input('tanggal')));
            $siswa->nik=$request->input('nik');
            $siswa->agama=$request->input('agama');
            $siswa->alamat=$request->input('alamat');
            $siswa->rt=$request->input('rt');
            $siswa->rw=$request->input('rw');
            $siswa->dusun=$request->input('dusun');
            $siswa->kelurahan=$request->input('kelurahan');
            $siswa->kecamatan=$request->input('kecamatan');
            $siswa->kode_pos=$request->input('pos');
            $siswa->no_skhun=$request->input('skhun');
            $siswa->nm_ayah=$request->input('ayah');
            $siswa->nm_ibu=$request->input('ibu');
            $siswa->kd_kelas=$request->input('kelas');
            $siswa->password=Hash::make($pass);
            $siswa->password_asli=$pass;
            $siswa->status=0;
            $siswa->no_peserta=$request->input('peserta');

            //$siswa->password=Hash::make($request->input('password'));
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
        $siswa=Siswa::find($id);

        return View('admin.siswa.detail')   
            ->with('siswa',$siswa);
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
            $siswa->nama=$request->input('nama');
            $siswa->jk=$request->input('jk');
            $siswa->tmp_lahir=$request->input('tempat');
            $siswa->tgl_lahir=date('Y-m-d',strtotime($request->input('tanggal')));
            $siswa->nik=$request->input('nik');
            $siswa->agama=$request->input('agama');
            $siswa->alamat=$request->input('alamat');
            $siswa->rt=$request->input('rt');
            $siswa->rw=$request->input('rw');
            $siswa->dusun=$request->input('dusun');
            $siswa->kelurahan=$request->input('kelurahan');
            $siswa->kecamatan=$request->input('kecamatan');
            $siswa->kode_pos=$request->input('pos');
            $siswa->no_skhun=$request->input('skhun');
            $siswa->nm_ayah=$request->input('ayah');
            $siswa->nm_ibu=$request->input('ibu');
            $siswa->kd_kelas=$request->input('kelas');

            //$siswa->password=Hash::make($request->input('password'));
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

    public function import(){
        return View('admin.siswa.import');
    }

    public function proses_import(Request $request){
        ini_set('max_execution_time', 300);
        
        $rules=['excel'=>'required'];
        $pesan=['excel.required'=>'File excel harus diisi'];

        $validasi=Validator::make($request->all(),$rules,$pesan);

        if($validasi->fails())
            return Redirect::back()->withErrors($validasi)->withInput();

        $excel=$request->file('excel');

        //ambil sheet pertama
        $excels=Excel::selectSheetsByIndex(0)->load($excel,function($reader){
            //options jika ada
        })->get();

        //digunakan untuk menghitung total siswa yang masuk
        $counter=0;

        $rowRules=[
            'no_peserta'=>'required',
            'nisn'=>'required',
            'nama'=>'required',
            'jk'=>'required',
            'rombel'=>'required'
            //'tmp_lahir'=>'required',
            //'tgl_lahir'=>'required',
            //'agama'=>'required',
            //'nm_ayah'=>'required',
            //'nm_ibu'=>'required',
            //'alamat'=>'required',
            //'thn_sttb'=>'required',
        ];

        foreach($excels as $row){
            //membuat validasi untuk row di excel
            //jangan lupa mengubah $row menjadi array
            $validasi=Validator::make($row->toArray(),$rowRules);

            //skip baris ini jika tidak valid, langsung ke baris berikutnya
            if($validasi->fails()) continue;

            $cek=Siswa::where('nis',$row['nisn'])->count();

            if($cek>0) continue;
            $pass=str_random(6);

            $data=array(
                'nis'=>$row['nisn'],
                'nama'=>$row['nama'],
                'kd_kelas'=>$row['rombel'],
                'jk'=>$row['jk'],
                'tmp_lahir'=>$row['tempat'],
                'tgl_lahir'=>$row['tanggal'],
                'nik'=>$row['nik'],
                'agama'=>$row['agama'],
                'alamat'=>$row['alamat'],
                'rt'=>$row['rt'],
                'rw'=>$row['rw'],
                'dusun'=>$row['dusun'],
                'kelurahan'=>$row['kelurahan'],
                'kecamatan'=>$row['kecamatan'],
                'kode_pos'=>$row['kode_pos'],
                'no_skhun'=>$row['skhun'],
                'nm_ayah'=>$row['ayah'],
                'nm_ibu'=>$row['ibu'],
                'no_peserta'=>$row['no_peserta'],
                'password'=>Hash::make($pass),
                'password_asli'=>$pass,
                'status'=>0
                //'jk'=>$row['jk'],
                //'tmp_lahir'=>$row['tmp_lahir'],
                //'tgl_lahir'=>$row['tgl_lahir'],
                //'agama'=>$row['agama'],
                //'nm_ayah'=>$row['nm_ayah'],
                //'nm_ibu'=>$row['nm_ibu'],
                //'alamat'=>$row['alamat'],
                //'thn_sttb'=>$row['thn_sttb'],
            );

            DB::table('siswa')->insert($data);

            $counter++;
        }

        Session::flash('pesan',"Berhasil mengimport ".$counter." siswa");

        return Redirect::to('admin/siswa');
    }
}
