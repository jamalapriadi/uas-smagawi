<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Models\Admin;

use Validator,Redirect,DB,Session;

class AdminController extends Controller{
	public function index(){
		return View('admin.index');
	}

    public function profile(){
        $admin=Admin::find($this->getId());

        return View('admin.profile')
            ->with('admin',$admin);
    }

    public function update_profile(Request $request){
        $rules=['nama'=>'required','email'=>'required|unique:admins,email,'.$request->id];
        $pesan=['nama.required'=>'Nama harus diisi','Email.required'=>'Email harus diisi','email.unique'=>'Email sudah ada'];

        $validasi=Validator::make($request->all(),$rules,$pesan);

        if($validasi->fails()){
            return Redirect::back()
                ->withInput()
                ->withErrors($validasi);
        }else{
            DB::table('admins')
                ->where('id', $request->input('id'))
                ->update(['name' => $request->input('nama'),'email'=>$request->input('email')]);

            Session::flash('pesan',"Data Berhasil diupdate");
            return Redirect::back();
        }
    }

    public function getId(){
        return auth()->guard('admin')->user()->id;
    }
}