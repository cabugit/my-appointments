<?php

namespace App\Http\Controllers\Admin;

use App\Models\User;
use App\Models\Specialty;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class DoctorController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //$doctors = User::Where('role', 'doctor')->get();
        // Usando Scopes definidos en el modelo USER
        $doctors = User::doctors()->get();

        return view('doctors.index', compact('doctors'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $suggested_password = str::random(8);
        $specialties = Specialty::all();
        return view('doctors.create', compact('suggested_password', 'specialties'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //dd($request->all());
        $this->performValidation($request);
        /*
        User::create([
            'name'      => $request->name,
            'email'     => $request->email,
            'dni'       => $request->dni,
            'address'   => $request->address,
            'phone'     => $request->phone,
            'role'      => 'doctor',
            'password'  => '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', // password
        ]);
        */
        $user = User::create($request->only('name','email','dni','address','phone') +
            [
            'role'      => 'doctor',
            'password'  => bcrypt($request->new_password)
            ]
        );

        // Cear relaciones con especialidades
        $user->specialties()->attach($request->specialties);

        $notification = 'El médico se ha registrado correctamente.';
        return redirect('doctors')->with(compact('notification'));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $user = User::findOrFail($id);
        $specialties = Specialty::all();
        $specialty_ids = $user->specialties()->pluck('specialties.id');
        return view('doctors.edit', compact('user','specialties', 'specialty_ids'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request,  $id)
    {
        $user = User::findOrFail($id);
        $this->performValidation($request, $id);
        $user->name     = $request->name;
        $user->email    = $request->email;
        $user->dni      = $request->dni;
        $user->address  = $request->address;
        $user->phone    = $request->phone;
        if($request->new_password)
            $user->password = bcrypt($request->new_password);
        $user->save();

        // Actualizar relaciones con especialidades
        $user->specialties()->sync($request->specialties);

        $notification = 'El médico se ha actualizado correctamente.';
        return redirect('doctors')->with(compact('notification'));
    }

    private function performValidation($request, $UserId=0){
        $rules = [
            'name'          => 'required|min:3|max:40|unique:users,name,'.$UserId,
            'email'         => 'email|required|min:10|max:100|unique:users,email,'.$UserId,
            'dni'           => 'nullable|digits:10|', //required|unique:users,dni, .$UserId
            'address'       => 'nullable|min:5',
            'phone'         => 'nullable|digits:10',
            'new_password'  => 'nullable|min:8',
        ];
        $messages = [
            'name.required'     => 'El nombre es requerido.',
            'name.min'          => 'El nombre debe tener al menos 3 caractéres.',
            'name.max'          => 'El nombre debe tener un máximo de 30 caractéres.',
            'name.unique'       => 'El nuevo nombre ya existe en la base de datos.',
        ];
        $this->validate($request, $rules, $messages);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id){
        $user = User::findOrFail($id);
        $userDeleted = $user->name;
        $user->delete();
        $notification = 'El médico "' . $userDeleted . '" se ha eliminado correctamente.';
        return redirect('doctors')->with(compact('notification'));
    }
}
