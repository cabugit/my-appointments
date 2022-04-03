<?php

namespace App\Http\Controllers;

use App\Models\Appointment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Cache;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        // fallaba cuando habia dias con 0 citas, recorriendo las columnas.
        /* $appointmentsByDay = Appointment::select([
            DB::raw('DAYOFWEEK(scheduled_date) as day'),
            DB::raw('COUNT(*) as count')
            ])->GroupBy(DB::raw('DAYOFWEEK(scheduled_date)'))
            ->whereIn('status', ['Confirmada','Atendida'])
            ->pluck('count')->toArray(); */

        // Correcto sin caché
        /* $results = Appointment::select([
            DB::raw('DAYOFWEEK(scheduled_date) as day'),
            DB::raw('COUNT(*) as count')
        ])->GroupBy(DB::raw('DAYOFWEEK(scheduled_date)'))
            ->whereIn('status', ['Confirmada','Atendida'])
            ->get(['day', 'count'])
            ->mapWithKeys(function ($item) {
                return [$item['day'] => $item['count']];
            })->toArray();
        // LLenar con 0 las columnas faltantes
        $appointmentsByDay = [];
        for ($i = 1; $i <= 7; $i++) {
            if (array_key_exists($i,  $results))
                //$appointmentsByDay[$i] = $results[$i]; *No debe ser arreglo asociativo
                $appointmentsByDay[] = $results[$i]; //  *Debe ser un arreglo simple
            else
                //$appointmentsByDay[$i] = 0;
                $appointmentsByDay[] = 0;
        } */

        // Usando caché
        $days = 7;
        $hours = 24 * $days;
        $minutes = 60 * $hours;
        $seconds = 60 * $minutes;
        $appointmentsByDay = Cache::remember('appointments_by_day', $seconds, function () {
            $results = Appointment::select([
                DB::raw('DAYOFWEEK(scheduled_date) as day'),
                DB::raw('COUNT(*) as count')
            ])->GroupBy(DB::raw('DAYOFWEEK(scheduled_date)'))
                ->whereIn('status', ['Confirmada','Atendida'])
                ->get(['day', 'count'])
                ->mapWithKeys(function ($item) {
                    return [$item['day'] => $item['count']];
                })->toArray();
            // LLenar con 0 las columnas faltantes
            $counts = [];
            for ($i = 1; $i <= 7; $i++) {
                if (array_key_exists($i,  $results))
                $counts[] = $results[$i];
                else
                $counts[] = 0;
            }
            return $counts;
        });

        return view('home', compact('appointmentsByDay'));
    }
}
