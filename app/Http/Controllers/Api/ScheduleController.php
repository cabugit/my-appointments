<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Interfaces\ScheduleServiceInterface;

class ScheduleController extends Controller
{
    public function hours(Request $request, ScheduleServiceInterface $ScheduleService){
        $rules = [
            'date' => 'required|date_format:"Y-m-d"',
            'doctor_id' => 'required|exists:users,id'
        ];
        $this->validate($request, $rules);
        $doctorId   = $request->doctor_id;
        $date       = $request->date;
        return $ScheduleService->getAvailableIntervals($date, $doctorId);
    }
}
