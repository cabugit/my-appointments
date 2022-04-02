<?php namespace App\Services;

use Carbon\Carbon;
use App\Models\WorkDay;
use App\Models\Appointment;
use App\Interfaces\ScheduleServiceInterface;

class ScheduleService implements ScheduleServiceInterface {

    private function getDayFromDate($date){
        // Carbon  0(sunday) - 6(saturday) => WeekDay 0(monday) - 6(sunday)
        $dateCarbon = new Carbon($date);
        $i          = $dateCarbon->dayOfWeek;
        $day        = ($i==0 ? 6 : $i-1);
        return $day;
    }

    public function isAvailableInterval($doctorId, $date, Carbon $start){
        // ¿Existe una cita en ésta Fecha y hora para éste médico?
        $exist = Appointment::where('doctor_id',$doctorId)
        ->where('scheduled_date',$date)
        ->where('scheduled_time',$start->format('H:i:s'))
        ->exists();
        return !$exist; // Available if already no exists.
    }

    public function getAvailableIntervals($date, $doctorId){
        $workDay = WorkDay::where('active', true)
            ->where('day', $this->getDayFromDate($date))
            ->where('user_id', $doctorId)->first([
                'morning_start',
                'morning_end',
                'afternoon_start',
                'afternoon_end'
            ]);

        if($workDay) {
            $morningIntervals   =
            $this->getIntervals($workDay->morning_start, $workDay->morning_end, $date, $doctorId);
            $afternoonIntervals =
            $this->getIntervals($workDay->afternoon_start, $workDay->afternoon_end, $date, $doctorId);
        } else {
            $morningIntervals   = [];
            $afternoonIntervals = [];
        }

        $data   = [];
        $data['morning']    =  $morningIntervals;
        $data['afternoon']  =  $afternoonIntervals;

        return $data;
    }

    private function getIntervals($start, $end, $date, $doctorId){
        $carbonStart   = new Carbon($start);
        $carbonEnd     = new Carbon($end);
        $intervals = [];
        while($carbonStart < $carbonEnd){
            $interval = [];
            $interval['start']  = $carbonStart->format('g:i A');

            // ¿Existe una cita en ésta Fecha y hora para éste médico?
            $isAvailableInterval =
                $this->isAvailableInterval($doctorId, $date, $carbonStart);
            /* $exist = Appointment::where('doctor_id',$doctor_id)
                    ->where('scheduled_date',$scheduled_date)
                    ->where('scheduled_time',$carbonStart->format('H:i:s'))
                    ->exists(); */

            $carbonStart->addMinutes(30);
            $interval['end'] = $carbonStart->format('g:i A');

            if($isAvailableInterval){
                $intervals[] = $interval;
            }
        }
        return $intervals;
    }
}
