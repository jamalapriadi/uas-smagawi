<?php
namespace App\Http\Controllers;

use App\Http\Controllers\Controller;

class GuruArea extends Controller{
	public function index(){
		return View('guru.index');
	}
}