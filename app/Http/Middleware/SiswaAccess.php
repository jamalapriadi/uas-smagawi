<?php

namespace App\Http\Middleware;

use Closure,Session,Redirect;

class SiswaAccess
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $auth=auth()->guard('siswa');

        if($auth->check()){
            return $next($request);
        };
        
        Session::flash('pesan',"Silahkan login sebagai Siswa terlebih dahulu");
        return Redirect::to('login/siswa');
    }
}
