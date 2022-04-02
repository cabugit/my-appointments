<?php

namespace App\Http\Controllers\Api;

use App\Models\Specialty;
use App\Http\Controllers\Controller;

class SpecialtyController extends Controller
{
    public function index(){
        //return 'Hola';
        return Specialty::all(['id', 'name']);
    }

    public function doctors(Specialty $specialty){
        return $specialty->users()->get([
            'users.id',
            'users.name'
        ]);
    }
}
