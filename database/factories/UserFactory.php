<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\User>
 */
class UserFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        return [
            'name' => $this->faker->name(),
            'email' => $this->faker->unique()->safeEmail(),
            'email_verified_at' => now(),
            'dni' => $this->faker->numberBetween($min = 1000000000, $max = 9999999999),
            'address' => $this->faker->address(),
            'phone' => $this->faker->numberBetween($min = 1000000000, $max = 9999999999),
            'role' => $this->faker->randomElement(['patient', 'doctor']),
            'password' => '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', // password
            'remember_token' => Str::random(10),
        ];
    }

    public function patient()
    {
        return $this->state(function (array $attributes) {
            return [
                'role' => 'patient'
            ];
        });
    }

    public function doctor()
    {
        return $this->state(function (array $attributes) {
            return [
                'role' => 'doctor'
            ];
        });
    }

    /**
     * Indicate that the model's email address should be unverified.
     *
     * @return static
     */
    public function unverified()
    {
        return $this->state(function (array $attributes) {
            return [
                'email_verified_at' => null,
            ];
        });
    }
}
