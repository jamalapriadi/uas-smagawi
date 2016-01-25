<?php

namespace App\Http\Middleware;

use Closure,Session,Redirect;

class GuruAccess
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
        $auth=auth()->guard('guru');

        if($auth->check()){
            return $next($request);
        };
        
        Session::flash('pesan',"Silahkan login sebagai Guru terlebih dahulu");
        return Redirect::to('login/guru');
    }
}
