<?php

namespace Database\Factories;

use App\Models\User;
use App\Models\Specialty;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Appointment>
 */
class AppointmentFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {

        $doctorIds      = User::doctors()->pluck('id');
        $patientIds     = User::patients()->pluck('id');

        $doctorRnd      = $this->faker->randomElement($doctorIds);

        $specialtyIds = User::find($doctorRnd)->specialties()
                            ->pluck('specialties.id');

        if($specialtyIds->isEmpty()){
            $specialtyRnd = null;
        } else {
            $specialtyRnd   = $this->faker->randomElement($specialtyIds);
        }

        $scheduled      = $this->faker
            ->dateTimeBetween($startDate = '-1 years', $endDate = 'now');
        $scheduled_date = $scheduled->format('Y-m-d');
        $scheduled_time = $scheduled->format('H:i:s');
        /* $scheduled      = $this->fecha_aleatoria('Y-m-d H:i:s', '2021-03-01', '2022-03-09');
        $scheduled_date = substr($scheduled,0,10);
        $scheduled_time = substr($scheduled,12,8); */

        $types  = ['Consulta', 'Examen', 'Operación'];
        $status = ['Atendida', 'Cancelada']; // 'Reservada', 'Confirmada'

        return [
            'description'       => $this->faker->sentence(5),
            'specialty_id'      => $specialtyRnd,
            'doctor_id'         => $doctorRnd,
            'patient_id'        => $this->faker->randomElement($patientIds),
            'scheduled_date'    => $scheduled_date,
            'scheduled_time'    => $scheduled_time,
            'type'              => $this->faker->randomElement($types),
            'status'            => $this->faker->randomElement($status)
        ];
    }

    /**
    *	@author parzibyte
    *
    *	@param string $formato El formato en el que deseamos que devuelva la fecha.
    *	por defecto es Y-m-d (2017-01-01)
    *
    *	@param string $limiteInferior Límite inferior desde donde queremos que tome la fecha.
    *	Por defecto es el 1 de enero de 1970
    *
    *	@param string $limiteSuperior Límite superior. Por defecto es el 1 de enero del 2038
    *
    *	@return string La fecha aleatoria
    */
    public function fecha_aleatoria($formato = "Y-m-d", $limiteInferior = "1970-01-01", $limiteSuperior = "2038-01-01"){
        // Convertimos la fecha como cadena a milisegundos
        $milisegundosLimiteInferior = strtotime($limiteInferior);
        $milisegundosLimiteSuperior = strtotime($limiteSuperior);

        // Buscamos un número aleatorio entre esas dos fechas
        $milisegundosAleatorios = mt_rand($milisegundosLimiteInferior, $milisegundosLimiteSuperior);

        // Regresamos la fecha con el formato especificado y los milisegundos aleatorios
        return date($formato, $milisegundosAleatorios);
    }
}
