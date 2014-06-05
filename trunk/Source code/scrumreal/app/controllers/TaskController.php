<?php

class TaskController extends BaseController {

  public function index($spid = '', $entity_type = '', $entity_id = '') {
    if (Session::has('current_project')) {
      $data = array();
      $user = new User;
      $task = new Task;
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
      if ($spid == '') {
        if (count($data['sprint_list']) !== 0) {
          $spid = $data['sprint_list'][0]->spid;
        } else {
          //If current project does not have any sprint
          return View::make('task', $data);
        }
      } else {
        $data['selected_sprint'] = $spid;
      }
      //Get story in sprint
      //IF GET BY TEAM -> get all stories for that team in current sprint
      if ($entity_type === 'team') {
        $data['story_in_sprint'] = $task->getStoryTaskByTeam($spid, $entity_id);
        $data['selected_team'] = $entity_id . '_team';
      } else {
        $data['story_in_sprint'] = $task->getStoryTask($spid);
      }
      //IF GET BY USR -> get all tasks for that user in current sprint
      if ($entity_type === 'user') {
        $data['selected_user'] = $entity_id . '_user';
        foreach ($data['story_in_sprint'] as $story) {
          $story->task_in_sprint = $task->getTaskInStoryByUser($story->sid, $entity_id);
        }
      } else {
        foreach ($data['story_in_sprint'] as $story) {
          $story->task_in_sprint = $task->getTaskInStory($story->sid);
        }
      }
//      print '<pre>';
//      print_r($data);
//      exit();
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
