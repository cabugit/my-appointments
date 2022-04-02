<?php

namespace Database\Seeders;

use App\Models\User;
use App\Models\WorkDay;
use App\Models\Specialty;
use App\Models\Appointment;
use Illuminate\Database\Seeder;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // Crear al administrador, un Médico con especialidad y horario
        // y un paciente iniciales.
        User::create([
            'name' => 'Juan Pérez',
            'email' => 'jperez@demo.com',
            'password' => bcrypt('12345678'),
            'role' => 'admin'
        ]);
        $specialty = Specialty::create([
            'name' => 'Nefrólogo'
        ]);
        $specialty->users()->save(
            User::create([
                'name' => 'Médico Test',
                'email' => 'doctor@demo.com',
                'password' => bcrypt('12345678'),
                'role' => 'doctor'
            ])
        );
        for ($i=0;$i<7;$i++){
            WorkDay::create([
                'user_id'           => 2,
                'day'               => $i,
                'active'            => ($i == 3),
                'morning_start'     => ($i == 3 ? '07:00:00' : '05:00:00'),
                'morning_end'       => ($i == 3 ? '09:30:00' : '05:00:00'),
                'afternoon_start'   => ($i == 3 ? '15:00:00' : '13:00:00'),
                'afternoon_end'     => ($i == 3 ? '18:00:00' : '13:00:00')
            ]);
        }

        User::create([
            'name' => 'Paciente Test',
            'email' => 'patient@demo.com',
            'password' => bcrypt('12345678'),
            'role' => 'patient'
        ]);

        // Crear las especialidades y sus doctores relacionados
        $specialties = [
            'Oftalmólogía',
            'Pediatría',
            'Neurología'
        ];
        foreach($specialties as $specialtyName){
            $specialty = Specialty::create([
                'name' => $specialtyName
            ]);
            /* $specialty->users()->save(
                User::factory()->doctor()->make()
            ); */
            $specialty->users()->saveMany(
                User::factory(3)->doctor()->make()
            );
        }

        // Asignar a 'Médico Test' la última Especialidad del ciclo anterior.
        User::find(2)->Specialties()->save($specialty);

        User::factory(50)->patient()->create();

        //Appointment::factory(300)->create();
    }
}
