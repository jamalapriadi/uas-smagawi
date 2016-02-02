<?php
namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Pengawas;

class PengawasArea extends Controller{
	public function index(){
		$pengawas=$this->getPengawas();

		return View('pengawas.index')
			->with('pengawas',$pengawas);
	}

	public function getPengawas(){
		$pengawas=Pengawas::find($this->getNip());

		return $pengawas;
	}

	public function getNip(){
		return auth()->guard('pengawas')->user()->nip;
	}
}