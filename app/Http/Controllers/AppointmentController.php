<?php

namespace App\Http\controllers;

use Carbon\Carbon;
use App\Models\Specialty;
use App\Models\Appointment;
use Illuminate\Http\Request;
use App\Services\ScheduleService;
use App\Http\Controllers\Controller;
use App\Models\CancelledAppointment;
use App\Http\Requests\StoreAppointment;
use App\Interfaces\ScheduleServiceInterface;

class AppointmentController extends Controller
{
    public function index(Request $request){
        // obtener el rol del usuario
        $role = Auth()->User()->role;
        // filas por página
        $perPage = 4;
        // Role == 'Admin' (All)
        if($role == 'admin'){
            // admin
            $pendingAppointments = Appointment::where('status','Reservada')
                ->paginate($perPage, ['*'], 'pending');
            $confirmedAppointments = Appointment::where('status','Confirmada')
                ->paginate($perPage, ['*'], 'confirmed');
            $oldAppointments = Appointment::whereIn('status',['Atendida', 'Cancelada'])
                ->paginate($perPage, ['*'], 'old');
        }
        elseif($role == 'doctor'){
            // Doctor
            $pendingAppointments = Appointment::where('status','Reservada')
                ->where('doctor_id', Auth()->id())
                ->paginate($perPage, ['*'], 'pending');
            $confirmedAppointments = Appointment::where('status','Confirmada')
                ->where('doctor_id', Auth()->id())
                ->paginate($perPage, ['*'], 'confirmed');
            $oldAppointments = Appointment::whereIn('status',['Atendida', 'Cancelada'])
                ->where('doctor_id', Auth()->id())
                ->paginate($perPage, ['*'], 'old');
        }
        elseif($role == 'patient'){
            // Patient
            $pendingAppointments = Appointment::where('status','Reservada')
                ->where('patient_id', Auth()->id())
                ->paginate($perPage, ['*'], 'pending');
            $confirmedAppointments = Appointment::where('status','Confirmada')
                ->where('patient_id', Auth()->id())
                ->paginate($perPage, ['*'], 'confirmed');
            $oldAppointments = Appointment::whereIn('status',['Atendida', 'Cancelada'])
                ->where('patient_id', Auth()->id())
                ->paginate($perPage, ['*'], 'old');
            }

        // Links de Paginas por numero de las 3 colecciones.
        $max_numbered = 10;
        $pages_pending = $this->paginator($pendingAppointments, $max_numbered);
        $pages_confirmed = $this->paginator($confirmedAppointments, $max_numbered);
        $pages_old = $this->paginator($oldAppointments, $max_numbered);

        // Paginando
        if(isset($request->tab))
            $tab = $request->tab;
        else
            $tab = 'confirmed';

        if(isset($request->old)){
            $old = $request->old;
        }   else $old = '';
        if(isset($request->confirmed)){
            $confirmed = $request->confirmed;
        }   else $confirmed = '';
        if(isset($request->pending)){
            $pending = $request->pending;
        }   else $pending = '';

        return view('appointments.index',
            compact('pendingAppointments','confirmedAppointments',
                'oldAppointments', 'tab',
                'pages_pending', 'pages_confirmed', 'pages_old', 'role',
                'pending', 'confirmed', 'old'
            ));
    }

    public function paginator($collection, $max_numbered = 10){
        $current_page = $collection->currentPage();
        if ($collection->hasPages())
            {
            $numOfpages   = $collection->lastPage();
            if ((floor($max_numbered) / 2) * 2  == $max_numbered)
            $is_pair = true; else $is_pair = false;
            $last_page  = $current_page + floor($max_numbered / 2);
            $first_page = $current_page - floor($max_numbered / 2);
            if ($is_pair) $first_page = $first_page - 1;
                if ($first_page < 1) {
                    $first_page = 1;
                    $last_page = $last_page + (1 - $first_page);
                }
            if(($last_page - $first_page + 1) < $max_numbered)
                $last_page += ($max_numbered - ($last_page - $first_page + 1));
            if ($last_page > $numOfpages) $last_page = $numOfpages;
            if(($last_page - $first_page + 1) < $max_numbered)
                $first_page -= ($max_numbered - ($last_page - $first_page + 1));
            if ($first_page < 1) $first_page = 1;
            }
            else
            {
            $numOfpages = 1;
            $first_page = 1;
            $last_page  = 1;
            }
        // Return 'first_page', 'current_page', 'last_page'
        $pages = [];
        $pages['first_page'] = $first_page;
        $pages['current_page'] = $current_page;
        $pages['last_page'] = $last_page;

        return $pages;
    }

    public function show(Appointment $appointment, Request $request){
        // obtener el rol del usuario
        $role = Auth()->User()->role;

        $scheduled_time = $appointment->scheduled_time;
        $time = new Carbon($scheduled_time); // Para usar $time->format('g:i A')
        //$appointment->doctor->name
        //$appointment->specialty->name
        $tab = 'old';
        if($appointment->status == 'Reservada')
            $tab = 'pending';
        elseif($appointment->status == 'Confirmada')
            $tab = 'confirmed';

        if(isset($request->old)){
            $old = $request->old;
        }   else $old = '';
        if(isset($request->confirmed)){
            $confirmed = $request->confirmed;
        }   else $confirmed = '';
        if(isset($request->pending)){
            $pending = $request->pending;
        }   else $pending = '';

        return view('appointments.show',
            compact('appointment','time','role','tab',
                    'pending', 'confirmed', 'old'));
    }

    public function create(ScheduleServiceInterface $ScheduleService){
        $specialties = Specialty::all();
        $specialtyId = old('specialty_id');
        if($specialtyId){
            $specialty = Specialty::find($specialtyId);
            $doctors = $specialty->users;
        }
        else {
            $doctors = collect();
        }

        $scheduledDate = old('scheduled_date');
        $doctorId = old('doctor_id');
        if($scheduledDate && $doctorId){
            $intervals = $ScheduleService->getAvailableIntervals($scheduledDate, $doctorId);
        }
        else{
            $intervals = null;
        }

        return view('appointments.create', compact('specialties', 'doctors', 'intervals'));
    }

    public function store(StoreAppointment $request){
        $created = Appointment::createForPatient($request);
        $messages = []; $notification = "";
        if($created)
            $notification = 'Su cita fué registrada correctamente.';
            else
            $messages[] = ['description' => 'No se logró registrar su cita. Reinténtelo.'];
        return back()->with(compact('notification', 'messages'));
    }

    public function confirm(Appointment $appointment, Request $request){
        $appointment->status = 'Confirmada';
        $appointment->save();

        $scheduled_time = $appointment->scheduled_time;
        $time = new Carbon($scheduled_time);
        $notification = 'La cita reservada para la Fecha: '.
        $appointment->scheduled_date.', Hora: '.$time->format('g:i A').
            ' con el Médico '. $appointment->doctor->name.
            ' de la Especialidad: '. $appointment->specialty->name.
            ' ha sido confirmada.';

        //FCM
        $users = [$appointment->patient_id];
        $downstreamResponse =
        send_notification_FCM('Cita Confirmada', $notification, $users);

        if(isset($request->old)){
            $old = $request->old;
        }   else $old = '';
        if(isset($request->confirmed)){
            $confirmed = $request->confirmed;
        }   else $confirmed = '';
        if(isset($request->pending)){
            $pending = $request->pending;
        }   else $pending = '';

        $tab = 'pending';
        return redirect('/appointments?tab=pending&confirmed='.$confirmed.'&pending='.$pending.'&old='.$old)->with(compact('notification', 'tab'));
    }

    public function showCancelForm(Appointment $appointment, Request $request){
        // obtener el rol del usuario
        $role = Auth()->User()->role;
        // Formatear la hora a 'hh:mm AM'
        $scheduled_time = $appointment->scheduled_time;
        $time = new Carbon($scheduled_time);

        $tab = 'old';
        if($appointment->status == 'Reservada')
            $tab = 'pending';
        elseif($appointment->status == 'Confirmada')
            $tab = 'confirmed';

        if(isset($request->old)){
            $old = $request->old;
        }   else $old = '';
        if(isset($request->confirmed)){
            $confirmed = $request->confirmed;
        }   else $confirmed = '';
        if(isset($request->pending)){
            $pending = $request->pending;
        }   else $pending = '';

        if($appointment->status == 'Confirmada' ||
            ($role != 'patient' && $appointment->status == 'Reservada'))
            return view('appointments.cancel',compact('appointment','role',
                        'time', 'tab', 'pending', 'confirmed', 'old'));

        return redirect('/appointments')->with(
                    compact('tab', 'pending', 'confirmed', 'old'));
    }

    public function cancel(Appointment $appointment, Request $request){
        $canceledStatus = $appointment->status;

        if($request->has('justification')){
            $cancellation = new CancelledAppointment();
            $cancellation->justification = $request->justification;
            $cancellation->cancelled_by_id  = Auth()->id();
            $appointment->cancellation()->save($cancellation);
        }
        $appointment->status = 'Cancelada';
        $appointment->save();

        $scheduled_time = $appointment->scheduled_time;
        $time = new Carbon($scheduled_time);

        $notification = 'La cita reservada para la Fecha: '.
        $appointment->scheduled_date.', Hora: '.$time->format('g:i A').
        ' con '.$appointment->doctor->name.' (Especialidad: '.
        $appointment->specialty->name.') '.
            'ha sido cancelada.';

        //FCM
        $users = [$appointment->patient_id];
        $downstreamResponse =
        send_notification_FCM('Cita Cancelada', $notification, $users);

        if(isset($request->old))
            $tab = $request->old;
        else
            $tab = 'confirmed';
        if($canceledStatus == 'Reservada'){
            $tab = 'pending';
        }

        if(isset($request->old)){
            $old = $request->old;
        }   else $old = '';
        if(isset($request->confirmed)){
            $confirmed = $request->confirmed;
        }   else $confirmed = '';
        if(isset($request->pending)){
            $pending = $request->pending;
        }   else $pending = '';

        return redirect('/appointments?tab='.$tab.'&confirmed='.$confirmed.'&pending='.$pending.'&old='.$old)->with(compact('notification', 'tab'));
    }
}
