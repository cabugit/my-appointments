<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class UserController extends Controller
{
    public function show(Request $request){
        return Auth()->User();
    }

    public function update(Request $request){
        $user = Auth()->User()->patient;
        $user->name     = $request->name;
        $user->phone    = $request->phone;
        $user->address  = $request->address;
        $user->save();
    }
}
