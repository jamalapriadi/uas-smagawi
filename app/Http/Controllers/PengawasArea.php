<?php
namespace App\Http\Controllers;

use App\Http\Controllers\Controller;

class PengawasArea extends Controller{
	public function index(){
		return View('pengawas.index');
	}
}