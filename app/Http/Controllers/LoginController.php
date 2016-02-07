<?php
namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Http\Requests;
use Validator,Redirect,Session,Hash;

class LoginController extends Controller{
	public function admin(){
		return View('login.admin');
	}

	public function siswa(){
		return View('login.siswa');
	}

	public function pengawas(){
		return View('login.pengawas');
	}

	public function guru(){
		return View('login.guru');
	}
}