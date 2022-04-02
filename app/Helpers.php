<?php

use App\Models\User;
use LaravelFCM\Facades\FCM;
use Illuminate\Http\Request;
use LaravelFCM\Message\OptionsBuilder;
use LaravelFCM\Message\PayloadDataBuilder;
use LaravelFCM\Message\PayloadNotificationBuilder;

use function PHPUnit\Framework\isEmpty;

function send_notification_FCM($title, $body, array $users = [], array $data = [])
{
    $optionBuilder = new OptionsBuilder();
    $optionBuilder->setTimeToLive(60 * 20);

    $notificationBuilder = new PayloadNotificationBuilder($title);
    $notificationBuilder->setBody($body)
        ->setSound('default');

    $dataBuilder = new PayloadDataBuilder();
    $dataBuilder->addData($data); //['a_data' => 'my_data']

    $option = $optionBuilder->build();
    $notification = $notificationBuilder->build();
    $data = $dataBuilder->build();

    // You must change it to get your tokens
    if ($users == []) {
        $tokens = User::where('device_token', '<>', '')
            ->pluck('device_token')
            ->toArray();
    } else {
        $tokens = User::whereIn('id', $users)
            ->where('device_token', '<>', '')
            ->pluck('device_token')
            ->toArray();
    }

    $downstreamResponse = FCM::sendTo($tokens, $option, $notification, $data);

    /*
        $downstreamResponse->numberSuccess();
        $downstreamResponse->numberFailure();
        $downstreamResponse->numberModification();

        // return Array - you must remove all this tokens in your database
        $downstreamResponse->tokensToDelete();

        // return Array (key : oldToken, value : new token - you must change the token in your database)
        $downstreamResponse->tokensToModify();

        // return Array - you should try to resend the message to the tokens in the array
        $downstreamResponse->tokensToRetry();

        // return Array (key:token, value:error) - in production you should remove from your database the tokens present in this array
        $downstreamResponse->tokensWithError();
        */

    return $downstreamResponse;
}
