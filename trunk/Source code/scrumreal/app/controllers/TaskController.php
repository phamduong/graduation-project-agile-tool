<?php

class TaskController extends BaseController {

  public function index() {
    if (Session::has('current_project')) {
      $data = array();
      $user = new User;
      //Comon data
      $data['lang'] = parent::getLanguage();
      $data['cur_user'] = parent::getCurrentUser();
      $data['active_nav'] = 'taskboard';
      $data['current_proj_name'] = Session::get('current_project_nm');
      //Taskboard page data
      $current_project = Session::get('current_project');
      $sprint = new Sprint;
      $team = new Team;
      $data['sprint_list'] = $sprint->getSprintInProject($current_project);
      $data['team_list'] = $team->getTeamOnProject($current_project);
      $data['user_list'] = $user->getUserInProject($current_project);
      return View::make('task', $data);
    } else {
      return Redirect::to('/project');
    }
  }

  public function add() {
    $input = Input::all();
    $task = new Task;
    $task->name = $input['name'];
    $task->time_estimate = $input['time_estimate'];
    $task->status = TASK_STATUS_TODO;
    $task->create_user = Auth::user()->uid;
    $task->description = $input['description'];
    $task->sid = $input['sid'];
    if ($task->save()) {
      $data = array('status' => 200, 'message' => '');
    } else {
      $data = array('status' => 800, 'message' => 'Add task unsuccessfully!');
    }
    return $data;
  }

  public function getDatatables($sid) {
//    print $sid;
//    exit();
    $data = array();
    $task = new Task;
    $data = $task->getTaskList($sid);
    return $data;
  }

}
