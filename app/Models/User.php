<?php
namespace App\Models;

use Laravel\Sanctum\HasApiTokens;
use Illuminate\Support\Facades\Hash;
use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;
    protected $fillable = [
        'name',
        'email',
        'dni',
        'address',
        'phone',
        'role',
        'password'
    ];
    protected $hidden = [
        'password',
        'remember_token',
        'pivot',
        'email_verified_at',
        'created_at',
        'updated_at'
    ];
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];
    public static $rules = [
        'name' => ['required', 'string', 'max:255'],
        'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
        'password' => ['required', 'string', 'min:8', 'confirmed']
    ];

    public static function createPatient(array $data) {
        return Self::create([
            'name' => $data['name'],
            'email' => $data['email'],
            'password' => Hash::make($data['password']),
            'role' => 'patient'
        ]);
    }

    public function scopePatients($query){
        return $query->Where('role', 'patient');
    }

    public function scopeDoctors($query){
        return $query->Where('role', 'doctor');
    }

    public function specialties(){
        return $this->belongsToMany(Specialty::class)->withTimestamps();
    }

    public function asDoctorAppointments(){
        return $this->hasMany(Appointment::class, 'doctor_id');
    }

    public function attendedAppointments(){
        return $this->asDoctorAppointments()
                    ->where('status', 'Atendida');
    }

    public function cancelledAppointments(){
        return $this->asDoctorAppointments()
                    ->where('status', 'Cancelada');
    }

    public function asPatientAppointments(){
        return $this->hasMany(Appointment::class, 'patient_id');
    }
}
