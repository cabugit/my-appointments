<?php

namespace App\Http\Controllers\Api;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class FirebaseController extends Controller
{
    public function postToken(Request $request) {
        if($request->has('device_token')) {
            $user_id = Auth()->id();
            $user = User::find($user_id);
            $user->device_token = $request->device_token;
            $user->save();
        }
    }
}
