<?php

namespace App\Http\Controllers\Api;

use Carbon\Carbon;
use App\Models\Appointment;
use App\Http\Controllers\Controller;
use App\Http\Requests\StoreAppointment;
use Illuminate\Support\Facades\Request;
use Illuminate\Support\Facades\Validator;
use App\Interfaces\ScheduleServiceInterface;

class AppointmentController extends Controller
{
    public function index(){
        $appointments = Appointment::where('patient_id', Auth()->id())
        ->with([
            'doctor' => function ($q) {
                $q->select(['id', 'name']);
            }
        ])
        ->with([
            'specialty' => function ($q) {
                $q->select(['id', 'name']);
            }
        ])
        ->get();
        return $appointments;
    }

    public function store(StoreAppointment $request){
        $appointment = Appointment::createForPatient($request);
        if($appointment)
            $success = true;
            else
            $success = false;
        return compact('success');
    }
}
