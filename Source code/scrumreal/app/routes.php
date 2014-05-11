<?php

/*
  |--------------------------------------------------------------------------
  | Application Routes
  |--------------------------------------------------------------------------
  |
  | Here is where you can register all of the routes for an application.
  | It's a breeze. Simply tell Laravel the URIs it should respond to
  | and give it the Closure to execute when that URI is requested.
  |
 */

//Route::get('/', function() {
//  return Redirect::to('/login');
//});

Route::any('/', [
    'uses' => 'UserController@login'
]);

Route::any('/login', [
    'uses' => 'UserController@login'
]);

Route::any('/logout', [
    'uses' => 'UserController@logout'
]);

Route::any('/user-profile', [
    'uses' => 'UserController@profile'
]);

Route::any('/user-settings', [
    'uses' => 'UserController@profile'
]);

Route::get('/language/{lang}', [
    'as' => 'language.select',
    'uses' => 'LanguageController@select'
]);

Route::post('/user/save', [
    'uses' => 'UserController@save'
]);

Route::post('/user/change-pass', [
    'uses' => 'UserController@changePass'
]);

Route::get('/project', [
    'uses' => 'ProjectController@index'
]);

Route::get('/dashboard', function() {
  return View::make('dashboard');
});

Route::get('/test', [
    'uses' => 'LanguageController@index'
]);
