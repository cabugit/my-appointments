<?php

namespace App\Http\Requests;

use Carbon\Carbon;
use App\Services\ScheduleService;
use Illuminate\Foundation\Http\FormRequest;
use App\Interfaces\ScheduleServiceInterface;

class StoreAppointment extends FormRequest
{

    private $scheduleService;
    public function __construct(ScheduleServiceInterface $ScheduleService){
        $this->scheduleService = $ScheduleService;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'description'       => 'required',
            'specialty_id'      => 'exists:specialties,id',
            'doctor_id'         => 'exists:users,id',
            'scheduled_time'    => 'required'
        ];
    }

    public function messages()
    {
        return [
            'scheduled_time.required' => 'Por favor seleccione una hora válida para su cita'
        ];
    }

    public function withValidator( $validator)
    {
        $validator->after(function ( $validator ) {
            $doctorId       = $this->doctor_id;
            $date           = $this->scheduled_date;
            $scheduled_time = $this->scheduled_time;

            if(!$doctorId || !$date || !$scheduled_time)
                return;
            $start = new Carbon($scheduled_time);

            if (!$this->scheduleService->isAvailableInterval($doctorId, $date, $start)) {
                $end = new Carbon($scheduled_time);
                $end->addMinutes(30);
                $validator->errors()->add(
                    'available-time',
                    'La hora seleccionada "'.$start->format('g:i A').' - '.$end->format('g:i A').'" ya se encuentra reservada por otro paciente.'
                );
            }
        });
    }
}
