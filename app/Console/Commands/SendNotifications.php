<?php

namespace App\Console\Commands;

use Carbon\Carbon;
use App\Models\Appointment;
use Illuminate\Console\Command;

class SendNotifications extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'fcm:send';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Enviar mensajes vía FCM';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        // Fecha y Hora actuales
        $now = Carbon::now(); // 2022-04-01 14:00:00

        $this->info('Buscando citas médicas confirmadas en las proximas 2 horas.');
        $appointments = $this->getAppointments2hours($now);
        foreach($appointments as $appointment){
            $this->sendNotificationFCM($appointment);
            $this->info('Mensaje FCM enviado 2h antes al paciente (id): '.$appointment->patient_id);
        }

        $this->info('Buscando citas médicas confirmadas en las proximas 24 horas.');
        $appointments = $this->getAppointments24hours($now);
        foreach($appointments as $appointment){
            $this->sendNotificationFCM($appointment);
            $this->info('Mensaje FCM enviado 24h antes al paciente (id): '.$appointment->patient_id);
        }
        return 0;
    }

    private function getAppointments2hours($now){
        return Appointment::where('status','Confirmada')
        ->where('scheduled_date', $now->toDateString())
        ->where('scheduled_time', '>=', $now->copy()->addMinutes(117)->toTimeString())
        ->where('scheduled_time', '<', $now->copy()->addMinutes(122)->toTimeString())
        ->get();
    }

    private function getAppointments24hours($now){
        return Appointment::where('status','Confirmada')
        ->where('scheduled_date', $now->addDay()->toDateString())
        ->where('scheduled_time', '>=', $now->copy()->subMinutes(3)->toTimeString())
        ->where('scheduled_time', '<', $now->copy()->addMinutes(2)->toTimeString())
        ->get();
    }

    private function sendNotificationFCM($appointment){
        //FCM
        $scheduled_time = $appointment->scheduled_time;
        $time = new Carbon($scheduled_time);
        $users = [$appointment->patient_id];
        $notification = 'Fecha: ' . $appointment->scheduled_date .
                        ', Hora: ' . $time->format('g:i A') .
                        ', Médico: ' . $appointment->doctor->name;
        $downstreamResponse =
            send_notification_FCM('Cita médica No. ' . $appointment->id. ' (recordatorio)', $notification, $users);
    }
}
