<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    //return view('welcome');
    return view('auth.login');
});

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

Route::middleware(['auth', 'admin'])->group(function () {
    // Specialties
    Route::get('/specialties', [App\Http\Controllers\Admin\SpecialtyController::class, 'index']);
    Route::get('/specialties/create', [App\Http\Controllers\Admin\SpecialtyController::class, 'create']);
    Route::post('/specialties', [App\Http\Controllers\Admin\SpecialtyController::class, 'store']);
    Route::get('/specialties/{specialty}/edit', [App\Http\Controllers\Admin\SpecialtyController::class, 'edit']);
    Route::put('/specialties/{specialty}', [App\Http\Controllers\Admin\SpecialtyController::class, 'update']);
    Route::delete('/specialties/{specialty}', [App\Http\Controllers\Admin\SpecialtyController::class, 'destroy']);
    // Doctors
    Route::resource('doctors', App\Http\Controllers\Admin\DoctorController::class);
    // Charts
    Route::get('/charts/appointments/line', [App\Http\Controllers\Admin\ChartController::class, 'appointments']);
    Route::get('/charts/doctors/column', [App\Http\Controllers\Admin\ChartController::class, 'doctors']);
    Route::get('/charts/doctors/column/data', [App\Http\Controllers\Admin\ChartController::class, 'doctorsJson']);
    // FCM
    Route::post('/fcm/send', [App\Http\Controllers\Admin\FirebaseController::class, 'sendAll']);
    });

Route::middleware(['auth'])->group(function () {
    // Patients
    Route::resource('/patients', App\Http\Controllers\Admin\PatientController::class);
});

Route::middleware(['auth', 'doctor'])->group(function () {
    Route::get('/schedule', [App\Http\Controllers\Doctor\ScheduleController::class, 'edit']);
    Route::post('/schedule', [App\Http\Controllers\Doctor\ScheduleController::class, 'store']);
    //Route::get('/patients', [App\Http\Controllers\Admin\PatientController::class,'index']);
});

Route::middleware(['auth'])->group(function () {
    Route::get('/appointments/create', [App\Http\Controllers\AppointmentController::class, 'create']);
    Route::post('/appointments', [App\Http\Controllers\AppointmentController::class, 'store']);
    Route::get('/appointments', [App\Http\Controllers\AppointmentController::class, 'index']);

    Route::get('/appointments/{appointment}', [App\Http\Controllers\AppointmentController::class, 'show']);
    Route::post('/appointments/{appointment}/confirm', [App\Http\Controllers\AppointmentController::class, 'confirm']);
    Route::get('/appointments/{appointment}/cancel', [App\Http\Controllers\AppointmentController::class, 'showCancelForm']);
    Route::post('/appointments/{appointment}/cancel', [App\Http\Controllers\AppointmentController::class, 'cancel']);
});
