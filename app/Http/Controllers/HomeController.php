<?php

namespace App\Http\Controllers;

use App\Models\Appointment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

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
        $appointmentsByDay = Appointment::select([
            DB::raw('DAYOFWEEK(scheduled_date) as day'),
            DB::raw('COUNT(*) as count')
            ])->GroupBy(DB::raw('DAYOFWEEK(scheduled_date)'))
            //->where('status','Confirmada')
            ->pluck('count')->toArray();
        //dd($appointmentsByDay);
        return view('home', compact('appointmentsByDay'));
    }
}
