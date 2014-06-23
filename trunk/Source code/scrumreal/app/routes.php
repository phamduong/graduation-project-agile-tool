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

Route::post('/user/edit', [
    'uses' => 'UserController@edit'
]);

Route::post('/user/delete', [
    'uses' => 'UserController@delete'
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

Route::post('/project/add', [
    'uses' => 'ProjectController@add'
]);

Route::post('/project/save', [
    'uses' => 'ProjectController@save'
]);

Route::post('/project/delete', [
    'uses' => 'ProjectController@delete'
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

Route::post('/story/approve', [
    'uses' => 'StoryController@approve'
]);

Route::post('/story/delete', [
    'uses' => 'StoryController@delete'
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

Route::post('/story/save', [
    'uses' => 'StoryController@save'
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

Route::get('/people/reload_list_staff', [
    'uses' => 'TeamController@reloadListStaff'
]);

Route::get('/team/reload_team_data/{tid}', 'TeamController@reloadTeamData');

Route::post('/team/save', [
    'uses' => 'TeamController@save'
]);

Route::post('/team/delete', [
    'uses' => 'TeamController@delete'
]);

Route::get('/sprint', [
    'uses' => 'SprintController@index'
]);

Route::post('/sprint/add', [
    'uses' => 'SprintController@add'
]);

Route::post('/sprint/edit', [
    'uses' => 'SprintController@edit'
]);

Route::post('/sprint/save', [
    'uses' => 'SprintController@save'
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

Route::post('/sprint/update_order', [
    'uses' => 'SprintController@updateStoryOrder'
]);

Route::get('/sprint/reload_story_list', [
    'uses' => 'SprintController@reloadStoryList'
]);


Route::post('/task/add', [
    'uses' => 'TaskController@add'
]);

Route::post('/task/edit', [
    'uses' => 'TaskController@edit'
]);

Route::post('/task/save', [
    'uses' => 'TaskController@save'
]);

Route::post('/task/update_status', [
    'uses' => 'TaskController@update_status'
]);

Route::get('/task/reload_task_detail/{taid}', 'TaskController@reloadTaskDetail');

Route::get('/task/reload_story_progress/{sid}', 'TaskController@reloadStoryProgress');

Route::get('/task/get_datatables/{sid}', 'TaskController@getDatatables');

Route::get('/taskboard/{spid?}/{entity_type?}/{entity_id?}', 'TaskController@index');

Route::post('/activity/get', [
    'uses' => 'ActivityController@getActivityForEntity'
]);

Route::any('/permission', [
    'uses' => 'PermissionController@index'
]);

Route::any('/permission/save', [
    'uses' => 'PermissionController@save'
]);

Route::any('/project/get_leader', [
    'uses' => 'ProjectController@getLeader'
]);

Route::any('/project/get_owner', [
    'uses' => 'ProjectController@getOwner'
]);

Route::any('/project/complete', [
    'uses' => 'ProjectController@complete'
]);

Route::any('/sprint/start_sprint', [
    'uses' => 'SprintController@startSprint'
]);

Route::any('/sprint/complete_sprint', [
    'uses' => 'SprintController@completeSprint'
]);

Route::any('/sprint/resume_sprint', [
    'uses' => 'SprintController@resumeSprint'
]);

Route::any('/sprint/delete', [
    'uses' => 'SprintController@delete'
]);

Route::any('/sprint/get_team_day', [
    'uses' => 'SprintController@getTeamDay'
]);

Route::any('/sprint/update_team_day', [
    'uses' => 'SprintController@updateTeamDay'
]);

Route::any('/sprint/get_team_day_all', [
    'uses' => 'SprintController@getTeamDayAll'
]);

Route::any('/burndown/sprint_all_team_burndown', [
    'uses' => 'ReportController@sprintAllTeamBurnDown'
]);

Route::any('/burndown/sprint_each_team_burndown', [
    'uses' => 'ReportController@sprintOneTeamBurnDown'
]);

Route::get('/burndown/{spid?}/{tid?}', 'ReportController@index');

Route::any('/burnup', [
    'uses' => 'ReportController@sprintBurnUp'
]);

Route::any('/burnup/initialize', [
    'uses' => 'ReportController@sprintBurnUpGetData'
]);
