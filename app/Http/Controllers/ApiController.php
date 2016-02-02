<?php
namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Siswa;

class ApiController extends Controller{
	public function siswa(){
		$siswa=Siswa::all();

		return json_encode($siswa);
	}
}