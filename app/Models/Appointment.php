<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use App\Http\Requests\StoreAppointment;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Request;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Appointment extends Model
{
    use HasFactory;
    protected $fillable = [
        'description',
        'specialty_id',
        'doctor_id',
        'patient_id',
        'scheduled_date',
        'scheduled_time',
        'type',
        'status'
    ];

    protected $hidden = [
    'updated_at','doctor_id',
    'patient_id','specialty_id','scheduled_time'
    ];

    protected $appends = [
        'scheduled_time_12'
        ];

    // Appointment(N)->Specialty(1)
    public function specialty(){
        return $this->BelongsTo(Specialty::class);
    }

    // Appointment(N)->Doctor(1)
    public function doctor(){
        return $this->BelongsTo(User::class);
    }

    // Appointment(N)->Patient(1)
    public function patient(){
        return $this->BelongsTo(User::class);
    }

    // Appointment(1)->CancelledAppointment(1)
    public function Cancellation(){
        return $this->HasOne(CancelledAppointment::class);
    }

    // Accessor
    // $appointment->scheduled_time_12
    public function getScheduledTime12Attribute(){
        $carbonTime = new Carbon($this->scheduled_time);
        return $carbonTime->Format('g:i A');
    }

    public static function createForPatient(StoreAppointment $request){
        $data = $request->only([
            'description',
            'specialty_id',
            'doctor_id',
            'scheduled_date',
            'scheduled_time',
            'type'
        ]);
        $data['patient_id'] = Auth::user()->id;
        $data['status'] = 'Reservada';

        // Pasar la hora de hh:mm AM a formato 24 horas hh:mm:ss
        $carbonTime = Carbon::createFromFormat('g:i A', $data['scheduled_time']);
        $data['scheduled_time'] = $carbonTime->format('H:i:s');

        return Appointment::create($data);
    }
}
