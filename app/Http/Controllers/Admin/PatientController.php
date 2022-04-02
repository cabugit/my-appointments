<?php

namespace App\Http\Controllers\Admin;

use App\Models\User;
use App\Models\Appointment;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;

class PatientController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $role = Auth()->User()->role;

        //$patients = User::Where('role', 'patient')->get();
        // Usando Scopes definidos en el modelo USER
        //$patients = User::patients()->get();
        if($role == 'Admin')
            $patients = User::patients()->paginate(5); // Paginando
            else
            {
                $PatientsByDoctor =
                Appointment::select('patient_id', DB::raw('COUNT(*) as count'))
                ->where('doctor_id', Auth()->User()->id)
                ->orderBy('patient_id', 'asc')
                ->groupBy('patient_id')
                ->pluck('patient_id')
                ->toArray();
                $patients = User::patients()
                    ->WhereIn('id',$PatientsByDoctor)->paginate(5); // Paginando
            }

        // Links de Paginas por numero a desplegar en el paginador
        $max_numbered = 10;
        $current_page = $patients->currentPage();
        if ($patients->hasPages())
            {
            $numOfpages   = $patients->lastPage();
            if ((floor($max_numbered) / 2) * 2  == $max_numbered)
            $is_pair = true; else $is_pair = false;
            $last_page  = $current_page + floor($max_numbered / 2);
            $first_page = $current_page - floor($max_numbered / 2);
            if ($is_pair) $first_page = $first_page - 1;
                if ($first_page < 1) {
                    $first_page = 1;
                    $last_page = $last_page + (1 - $first_page);
                }
            if ($last_page > $numOfpages) $last_page = $numOfpages;
            }
            else
            {
            $numOfpages = 1;
            $first_page = 1;
            $last_page  = 1;
            }

        return view('patients.index', compact('patients', 'first_page', 'current_page', 'last_page'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $suggested_password = str::random(8);
        return view('patients.create', compact('suggested_password'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //dd($request->name);
        $this->performValidation($request);
        /*
        User::create([
            'name'      => $request->name,
            'email'     => $request->email,
            'dni'       => $request->dni,
            'address'   => $request->address,
            'phone'     => $request->phone,
            'role'      => 'patient',
            'password'  => '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', // password
        ]);
        */
        User::create($request->only('name','email','dni','address','phone') +
            [
            'role'      => 'patient',
            'password'  => bcrypt($request->new_password)
            ]
        );

        $notification = 'El paciente se ha registrado correctamente.';
        return redirect('patients')->with(compact('notification'));
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
        return view('patients.edit', compact('user'));
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
        $notification = 'El paciente se ha actualizado correctamente.';
        return redirect('patients')->with(compact('notification'));
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
        $notification = 'El paciente "' . $userDeleted . '" se ha eliminado correctamente.';
        return redirect('patients')->with(compact('notification'));
    }
}
