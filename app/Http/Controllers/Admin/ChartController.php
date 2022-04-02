<?php

namespace App\Http\Controllers\admin;

use Carbon\Carbon;
use App\Models\User;
use App\Models\Specialty;

use App\Models\Appointment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;

class ChartController extends Controller
{
    public function appointments(){
        $montlyCounts = Appointment::select(
            DB::raw('MONTH(scheduled_date) as month'),
            DB::raw('COUNT(1) as count'))
                ->where('status', 'Atendida')
                ->groupBy('month')->get()->toArray();
        // Tenemos     [['mounth' => 11, 'count' => 3]]
        // necesitamos [0,0,3,0,0,0,0,0,0,0,0,0] marzo en pos 2.
        $counts = array_fill(0,12,0); // (index ini, elements, value)
                // creamos un array de 12 elementos con valor 0.
        foreach($montlyCounts as $montlyCount){
            $index = $montlyCount['month'] - 1;
            $counts[$index] = $montlyCount['count'];
        }
        return view('charts.appointments', compact('counts'));
    }

    public function doctors(){
        $now = Carbon::now();
        $end = $now->format('Y-m-d');
        $start = $now->subYear()->format('Y-m-d');;
        return view('charts.doctors', compact('start', 'end'));
    }

    public function doctorsJson(Request $request){
        $start = $request->start;
        $end   = $request->end;
        // Doctores con mas citas
        $doctors = User::doctors()
        ->select(['name'])
        ->withCount([
            'attendedAppointments'  => function($query) use ($start, $end){
                $query->whereBetween('scheduled_date', [$start, $end]);
            },
            'cancelledAppointments'  => function($query) use ($start, $end){
                $query->whereBetween('scheduled_date', [$start, $end]);
            }
        ])
        ->orderBy('attended_appointments_count','desc')
        ->orderBy('cancelled_appointments_count','asc')
        ->take(3)
        ->get(); // ->toArray()
        //dd($doctors->pluck('name')->toArray());

        $data = [];
        // Doctors
        $data['categories'] = $doctors->pluck('name')->toArray();
        $series = [];
        // Atendidas
        $series1['name'] = 'Citas atendidas';
        $series1['data'] = $doctors
            ->pluck('attended_appointments_count')
            ->toArray();
        // Canceladas
        $series2['name'] = 'Citas canceladas';
        $series2['data'] = $doctors
            ->pluck('cancelled_appointments_count')
            ->toArray();
        $series[] = $series1;
        $series[] = $series2;
        $data['series'] = $series;

        return $data;
    }
}
