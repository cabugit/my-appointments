<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function edit(){
        $user_id = Auth()->id();
        $user = User::find($user_id);
        return view('profile', compact('user'));
    }

    public function update(Request $request){
        $user_id = Auth()->id();
        $user = User::find($user_id);
        $user->name     = $request->name;
        $user->phone    = $request->phone;
        $user->address  = $request->address;
        $user->save();
        $notification = 'Los datos han sido actualizados satisfactoriamente.';
        return back()->with(compact('notification'));
    }
}
