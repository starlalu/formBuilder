<?php

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
    return view('welcome');
});

Auth::routes();



Route::group(['middleware' => 'RolesCheck'], function()
{
    //All the routes that belongs to the group goes here
    Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
    Route::get('/forms', [App\Http\Controllers\HomeController::class, 'forms'])->name('forms');
    Route::post('/dynamicFormSubmit', [App\Http\Controllers\HomeController::class,'dynamicFormSubmit'])->name('dynamicFormSubmit');
});
