<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class FirebaseController extends Controller
{
    public function sendAll(Request $request) // code-lts / Laravel-FCM
    {
        //send_notification_FCM($title, $body, Array $users = [],  Array $data = [])
        $downstreamResponse = send_notification_FCM($request->title, $request->body);
        if ($downstreamResponse->numberFailure()==0) {
            $notification = 'Notificación enviada a todos los usuarios android('.$downstreamResponse->numberSuccess().').';
            $message = '';
        } else {
            $message = $downstreamResponse->numberFailure().' fallos y '.$downstreamResponse->numberSuccess().' envíos exitosos.';
            $notification = '';
        }
        return back()->with(compact('notification', 'message'));
    }
}
