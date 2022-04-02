<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::post('/login', 'App\Http\Controllers\Api\AuthController@login');
Route::post('/register', 'App\Http\Controllers\Api\AuthController@register');

// Public resources
Route::get('/specialties', [App\Http\Controllers\Api\SpecialtyController::class,'index']);
Route::get('/specialties/{specialty}/doctors', [App\Http\Controllers\Api\SpecialtyController::class,'doctors']);
Route::get('/schedule/hours', [App\Http\Controllers\Api\ScheduleController::class,'hours']);

Route::middleware('auth:sanctum')->group(function () {
    Route::get('/user', 'App\Http\Controllers\Api\UserController@show');
    Route::post('/logout', 'App\Http\Controllers\Api\AuthController@logout');

    // Appointments
    Route::get('/appointments', 'App\Http\Controllers\Api\AppointmentController@index');
    Route::post('/appointments', 'App\Http\Controllers\Api\AppointmentController@store');

    // FCMService
    Route::post('/fcm/token', 'App\Http\Controllers\Api\FirebaseController@postToken');
});
