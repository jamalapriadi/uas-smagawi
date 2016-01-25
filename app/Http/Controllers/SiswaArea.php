<?php
namespace App\Http\Controllers;

use App\Http\Controllers\Controller;

class SiswaArea extends Controller{
	public function index(){
		return View('siswa.index');
	}
}