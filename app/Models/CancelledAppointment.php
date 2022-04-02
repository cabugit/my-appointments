<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CancelledAppointment extends Model
{
    use HasFactory;
    protected $fillable = [
        'appointment_id',
        'justification',
        'cancelled_by_id'
    ];

    // CancelledAppointment(N)->User(1)
    public function cancelled_by(){
        return $this->BelongsTo(User::class);
    }
}
