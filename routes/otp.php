<?php

/*
|--------------------------------------------------------------------------
| OTP Routes
|--------------------------------------------------------------------------
|
| Here is where you can register admin routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

use Illuminate\Support\Facades\Route;

//Verofocation phone
Route::get('/verification', 'OTPVerificationController@verification')->name('verification');
Route::post('/verification', 'OTPVerificationController@verify_phone')->name('verification.submit');
Route::get('/verification/phone/code/resend', 'OTPVerificationController@resend_verificcation_code')->name('verification.phone.resend');

//Forgot password phone
Route::post('/password/reset/submit', 'OTPVerificationController@reset_password_with_code')->name('password.update.phone');

//Admin
Route::group(['prefix' =>'admin', 'middleware' => ['auth', 'admin']], function(){

    Route::get('/otp-credentials-configuration', 'OTPController@credentials_index')->name('otp_credentials.index');
	Route::post('/otp-credentials-update', 'OTPController@update_credentials')->name('update_credentials');

    Route::resource('/sms-templates','SmsTemplateController');

    //Messaging
    Route::get('/bulk-sms', 'OTPController@bulk_sms')->name('bulk_sms.index');
    Route::post('/bulk-sms-send', 'OTPController@bulk_sms_send')->name('bulk_sms.send');
});
