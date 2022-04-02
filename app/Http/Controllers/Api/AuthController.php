<?php

namespace App\Http\Controllers\Api;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Auth\Events\Registered;
use App\Http\Traits\ValidateAndCreatePatient;

class AuthController extends Controller
{
    use ValidateAndCreatePatient;

    public function login(Request $request){
        $user=User::where('email', $request->email)->first();
        if (! $user || ! Hash::check($request->password, $user->password)) return response()->json([
            'success' => false,
            'message' => 'Las credenciales son incorrectas!!!'
        ]);
        $jwt = $user->createToken($request->email)->plainTextToken;
        return response()->json([
            'success' => true,
            'user' => $user,
            'jwt' => $jwt
        ]);
    }

    public function logout(Request $request){
        // Revoke the token that was used to authenticate the current request...
        $request->user()->currentAccessToken()->delete();
        return response()->json([
            'success' => true
        ]);
    }
    public function register(Request $request){
        $this->validator($request->all())->validate();
        event(new Registered($user = $this->create($request->all())));
        $this->login($request);
        $jwt = $user->createToken($request->email)->plainTextToken;

        return response()->json([
        'success' => true,
        'user' => $user,
        'jwt' => $jwt
        ]);
    }
}
