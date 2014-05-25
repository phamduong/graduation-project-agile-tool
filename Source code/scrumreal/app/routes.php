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

Route::post('/user/add', [
    'uses' => 'UserController@add'
]);

Route::post('/user/change-pass', [
    'uses' => 'UserController@changePass'
]);

Route::get('/project', [
    'uses' => 'ProjectController@index'
]);

Route::get('/project/datatables', [
    'uses' => 'ProjectController@getDatatables'
]);

Route::post('/project/edit', [
    'uses' => 'ProjectController@edit'
]);

Route::post('/project/set_current', [
    'uses' => 'ProjectController@setCurrentProject'
]);

Route::get('/project/check_current', [
    'uses' => 'ProjectController@checkCurrentProject'
]);

Route::get('/story', [
    'uses' => 'StoryController@index'
]);

Route::post('/comment/reply', [
    'uses' => 'CommentController@reply'
]);

Route::post('/comment/add', [
    'uses' => 'CommentController@add'
]);

Route::post('/story/add', [
    'uses' => 'StoryController@add'
]);

Route::get('/story/datatables', [
    'uses' => 'StoryController@getDataTables'
]);

Route::post('/story/edit', [
    'uses' => 'StoryController@edit'
]);

Route::get('/people', [
    'uses' => 'TeamController@index'
]);

Route::post('/team/add', [
    'uses' => 'TeamController@addTeam'
]);

Route::post('/team/edit', [
    'uses' => 'TeamController@editTeam'
]);

Route::post('/people/remove_from_project', [
    'uses' => 'TeamController@removeFromProject'
]);

Route::post('/people/add_to_project', [
    'uses' => 'TeamController@addToProject'
]);

Route::post('/people/move_to_team', [
    'uses' => 'TeamController@moveToTeam'
]);

Route::get('/dashboard', function() {
  return View::make('dashboard');
});

Route::get('/sprint', [
    'uses' => 'SprintController@index'
]);

Route::post('/sprint/add', [
    'uses' => 'SprintController@add'
]);

Route::post('/sprint/edit', [
    'uses' => 'SprintController@edit'
]);

Route::post('/sprint/add_story_to_sprint', [
    'uses' => 'SprintController@addStory'
]);

Route::post('/sprint/move_story_to_sprint', [
    'uses' => 'SprintController@moveStory'
]);

Route::post('/sprint/remove_story_from_sprint', [
    'uses' => 'SprintController@removeStory'
]);

Route::post('/project/add', [
    'uses' => 'ProjectController@add'
]);


Route::get('/test', [
    'uses' => 'LanguageController@index'
]);
