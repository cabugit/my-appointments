<?php

namespace App\Http\Controllers\Admin;

use App\Models\Specialty;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class SpecialtyController extends Controller
{
    public function index(){
        $specialties = Specialty::all();
        return view('specialties.index', compact('specialties'));
    }

    public function create(){
        return view('specialties.create');
    }

    public function store(Request $request){
        //dd($request->all());
        $this->performValidation($request);
        $specialty = new Specialty();
        $specialty->name = $request->input('name');
        $specialty->description = $request->input('description');
        $specialty->save();
        $notification = 'La especialidad se ha registrado correctamente.';
        return redirect('specialties')->with(compact('notification'));
    }

    public function edit(Specialty $specialty){
        return view('specialties.edit', compact('specialty'));
    }

    public function update(Request $request, Specialty $specialty){
        //dd($request->all());
        $this->performValidation($request, $specialty->id);
        $specialty->name = $request->input('name');
        $specialty->description = $request->input('description');
        $specialty->save();
        $notification = 'La especialidad se ha actualizado correctamente.';
        return redirect('specialties')->with(compact('notification'));
    }

    private function performValidation($request, $specialtyId=0){
        $rules = [
            'name'          => 'required|min:3|max:30|unique:specialties,name,'.$specialtyId,
            'description'   => 'max:100'
        ];
        $messages = [
            'name.required'     => 'El nombre es requerido.',
            'name.min'          => 'El nombre debe tener al menos 3 caractéres.',
            'name.max'          => 'El nombre debe tener un máximo de 30 caractéres.',
            'name.unique'       => 'El nuevo nombre ya existe en la base de datos.',
            'description.max'   => 'La descripción debe tener un máximo de 30 caractéres.'
        ];
        $this->validate($request, $rules, $messages);
    }

    public function destroy(Specialty $specialty){
        $specialtyDeleted = $specialty->name;
        $specialty->delete();
        $notification = 'La especialidad "' . $specialtyDeleted . '" se ha eliminado correctamente.';
        return redirect('specialties')->with(compact('notification'));
    }
}
