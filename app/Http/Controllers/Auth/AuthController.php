<?php

namespace App\Http\Controllers\Auth;

use App\User;
use Validator;
use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\ThrottlesLogins;
use Illuminate\Foundation\Auth\AuthenticatesAndRegistersUsers;
use Illuminate\Support\Facades\Input;

use Redirect,Session;

class AuthController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Registration & Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users, as well as the
    | authentication of existing users. By default, this controller uses
    | a simple trait to add these behaviors. Why don't you explore it?
    |
    */

    use AuthenticatesAndRegistersUsers, ThrottlesLogins;

    /**
     * Where to redirect users after login / registration.
     *
     * @var string
     */
    protected $redirectTo = '/';

    /**
     * Create a new authentication controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest', ['except' => 'logout']);
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'name' => 'required|max:255',
            'email' => 'required|email|max:255|unique:users',
            'password' => 'required|confirmed|min:6',
        ]);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return User
     */
    protected function create(array $data)
    {
        return User::create([
            'name' => $data['name'],
            'email' => $data['email'],
            'password' => bcrypt($data['password']),
        ]);
    }

    public function admin(){
        return View('login.admin');
    }

    public function proses_admin(){
        $rules=[
            'email'=>'required|email',
            'password'=>'required'
        ];

        $pesan=[
            'email.required'=>'Email harus diisi',
            'email.email'=>'Email tidak valid',
            'password.required'=>'Password harus diisi'
        ];

        $validasi=Validator::make(Input::all(),$rules,$pesan);

        if($validasi->fails()){
            return Redirect::back()
                ->withInput()
                ->withErrors($validasi);
        }else{
            //cek di tabel user
            $auth=auth()->guard('admin');

            $userdata = array(
                'email'     => Input::get('email'),
                'password'  => Input::get('password')
            );

            if ($auth->attempt($userdata)) {
                return Redirect::to('admin');
            }else{
                return Redirect::to('login/admin')
                    ->withPesan('Username atau Password salah');
            }
        }
    }

    public function siswa(){
        return View('login.siswa');
    }

    public function proses_siswa(){
        $rules=[
            'nis'=>'required',
            'password'=>'required'
        ];

        $pesan=[
            'nis.required'=>'Nis harus diisi',
            'password.required'=>'Password harus diisi'
        ];

        $validasi=Validator::make(Input::all(),$rules,$pesan);

        if($validasi->fails()){
            return Redirect::back()
                ->withInput()
                ->withErrors($validasi);
        }else{
            //cek di tabel user
            $auth=auth()->guard('siswa');

            $userdata = array(
                'nis'     => Input::get('nis'),
                'password'  => Input::get('password')
            );

            if ($auth->attempt($userdata)) {
                return Redirect::to('siswa');
            }else{
                return Redirect::to('login/siswa')
                    ->withPesan('Username atau Password salah');
            }
        }
    }

    public function pengawas(){
        return View('login.pengawas');
    }

    public function proses_pengawas(){
        $rules=[
            'nip'=>'required',
            'password'=>'required'
        ];

        $pesan=[
            'nip.required'=>'nip harus diisi',
            'password.required'=>'Password harus diisi'
        ];

        $validasi=Validator::make(Input::all(),$rules,$pesan);

        if($validasi->fails()){
            return Redirect::back()
                ->withInput()
                ->withErrors($validasi);
        }else{
            //cek di tabel user
            $auth=auth()->guard('pengawas');

            $userdata = array(
                'nip'     => Input::get('nip'),
                'password'  => Input::get('password')
            );

            if ($auth->attempt($userdata)) {
                return Redirect::to('pengawas');
            }else{
                return Redirect::to('login/pengawas')
                    ->withPesan('Username atau Password salah');
            }
        }
    }

    public function guru(){
        return View('login.guru');
    }

    public function proses_guru(){
        $rules=[
            'nip'=>'required',
            'password'=>'required'
        ];

        $pesan=[
            'nip.required'=>'nip harus diisi',
            'password.required'=>'Password harus diisi'
        ];

        $validasi=Validator::make(Input::all(),$rules,$pesan);

        if($validasi->fails()){
            return Redirect::back()
                ->withInput()
                ->withErrors($validasi);
        }else{
            //cek di tabel user
            $auth=auth()->guard('guru');

            $userdata = array(
                'nip'     => Input::get('nip'),
                'password'  => Input::get('password')
            );

            if ($auth->attempt($userdata)) {
                return Redirect::to('guru');
            }else{
                return Redirect::to('login/guru')
                    ->withPesan('Username atau Password salah');
            }
        }
    }

    public function logout(){
        auth()->guard('admin')->logout();

        Session::flash('pesan','Anda berhasil logout');

        return Redirect::to('login/admin');
    }

    public function logout_siswa(){
        auth()->guard('siswa')->logout();

        Session::flash('pesan','Anda berhasil logout');

        return Redirect::to('login/siswa');
    }

    public function logout_guru(){
        auth()->guard('guru')->logout();

        Session::flash('pesan','Anda berhasil logout');

        return Redirect::to('login/guru');
    }

    public function logout_pengawas(){
        auth()->guard('pengawas')->logout();

        Session::flash('pesan','Anda berhasil logout');

        return Redirect::to('login/pengawas');
    }
}
