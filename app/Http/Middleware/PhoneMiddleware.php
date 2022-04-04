<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class PhoneMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        if(Auth()->User()->phone)
            return $next($request);

        $notification = 'Es necesario asociar un número de teléfono para registrar citas.';
        return redirect('/profile')->with(compact('notification'));
    }
}
