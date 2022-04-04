<?php

namespace App\Http\Controllers\Api;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class UserController extends Controller
{
    public function show(Request $request){
        return Auth()->User();
    }

    public function update(Request $request){
        $user_id = Auth()->id();
            $user = User::find($user_id);
        $user->name     = $request->name;
        $user->phone    = $request->phone;
        $user->address  = $request->address;
        $user->save();
    }
}
