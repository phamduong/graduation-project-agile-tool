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
//        $data['selected_sprint'] = $spid;
      }
      $data['selected_sprint'] = $spid;
      $data['sprint_status'] = Sprint::find($spid)->status;
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
          $story->task_in_story = $task->getTaskInStoryByUser($story->sid, $entity_id);
        }
      } else {
        foreach ($data['story_in_sprint'] as $story) {
          $story->task_in_story = $task->getTaskInStory($story->sid);
        }
      }
      //Caculate progress
      $total_time_estimate = 0;
      $total_time_remain = 0;
      foreach ($data['story_in_sprint'] as $story) {
        foreach ($story->task_in_story as $task) {
          if ($task->time_estimate != 0) {
            $task->progress = 100 - floor(($task->time_remain / $task->time_estimate) * 100);
            $total_time_estimate += $task->time_estimate;
            $total_time_remain += $task->time_remain;
          } else {
            $task->progress = 0;
          }
        }
        //If filter by user
        if ($entity_type === 'user') {
          $story->progress = $this->getStoryProgress($story->sid);
        } else {
          if ($total_time_estimate != 0) {
            $story->progress = 100 - floor(($total_time_remain / $total_time_estimate) * 100);
          } else {
            $story->progress = 0;
          }
          $total_time_estimate = 0;
          $total_time_remain = 0;
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
    $task->time_remain = $input['time_estimate'];
    $task->status = TASK_STATUS_TODO;
    $task->create_user = Auth::user()->uid;
    $task->description = $input['description'];
    $task->sid = $input['sid'];
    if ($task->save()) {
      //activity
      ActivityController::createActivityAdd($input['sid'], ENTITY_STORY, $task->taid, ENTITY_TASK);
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

  public function edit() {
    $input = Input::all();
    if (isset($input['taid'])) {
      $taid = $input['taid'];
      $task = new Task;
      $story = new Story;
      $comment = new Comment;
      $data['task_info'] = $task->getTaskDetail($taid);
      if (count($story->getStoryThatAssigned($data['task_info']->sid)) == 0) {
        $data['task_info']->assign = 0;
      } else {
        $sid = $story->getStoryThatAssigned($data['task_info']->sid)[0]->sid;
        $data['task_info']->assign = 1;
        $data['user_in_team'] = $task->getPeopleCanAssign($sid);
      }
      $data['comment'] = $comment->getComment($taid, ENTITY_TASK);
      $data['status'] = 200;
    } else {
      $data['status'] = 800;
      $data['message'] = 'Error!';
    }
    return $data;
  }

  public function save() {
    $input = Input::all();
    $story = new Story;
    $task = Task::find($input['taid']);
    if($task->name != $input['name']){
      //activity
      ActivityController::createActivityUpdate($input['taid'], ENTITY_TASK, 'Name', $task->name, $input['name']);
      $task->name = $input['name'];
    }
    if($task->time_estimate != $input['time_estimate']){
      //activity
      ActivityController::createActivityUpdate($input['taid'], ENTITY_TASK, 'Estimate time', $task->time_estimate, $input['time_estimate']);
      $task->time_estimate = $input['time_estimate'];
    }
    if($task->description != $input['description']){
      //activity
      ActivityController::createActivityUpdate($input['taid'], ENTITY_TASK, 'Description', $task->description, $input['description']);
      $task->description = $input['description'];
    }
    if (isset($input['time_remain']) && $input['time_remain'] != $task->time_remain) {
      if ($input['time_remain'] > $input['time_estimate']) {
        $task->time_remain = $input['time_estimate'];
      } else {
        $task->time_remain = $input['time_remain'];
      }
      ActivityController::createActivityUpdate($input['taid'], ENTITY_TASK, 'Time remain', $task->time_remain, $input['time_remain']);
    }
    if (count($story->getStoryThatAssigned($task->sid)) != 0) {
      if($task->uid != $input['uid']){
        $new_user = User::find($input['uid'])->fullname;
        $old_user = User::find($task->uid)->fullname;
        ActivityController::createActivityUpdate($input['taid'], ENTITY_TASK, 'User assign', $old_user, $new_user);
        $task->uid = $input['uid'];
      }
    }
    if ($task->save()) {
      $data = array('status' => 200, 'message' => '');
    } else {
      $data = array('status' => 800, 'message' => 'Save task unsuccessfully!');
    }
    return $data;
  }

  public function update_status() {
    $input = Input::all();
    $task = Task::find($input['taid']);
    $task_status = array(
        1 => 'To do',
        2 => 'In Progress',
        3 => 'To test',
        4 => 'Done'
    );
    if($task->status != $input['status']){
      ActivityController::createActivityUpdate($task->taid, ENTITY_TASK, 'Status', $task_status[$task->status], $task_status[$input['status']]);
      $task->status = $input['status'];
    }
    if ($input['status'] >= 3) {
      $task->time_remain = 0;
    } else if ($input['status'] === 1) {
      $task->time_remain = $task->time_estimate;
    }
    if ($task->save()) {
      $data = array('status' => 200, 'message' => '');
    } else {
      $data = array('status' => 800, 'message' => 'Save task unsuccessfully!');
    }
    return $data;
  }

  public function reloadTaskDetail($taid) {
    $task_model = new Task;
    $task = $task_model->getTaskDetail($taid);
    if ($task->time_estimate != 0) {
      $task->progress = 100 - floor(($task->time_remain / $task->time_estimate) * 100);
    } else {
      $task->progress = 0;
    }
    $html = '';
    $html .= '<div class="box-title"></div><div class="box-content"><div class="row-fluid"><div class="span8">';
    $html .= '<span class="task-name"><i class="icon-file"></i>';
    $html .= '<a href="' . $task->taid . '" class="task_edit_task">' . $task->name . '</a></span></div><div class="span4">';
    if ($task->user_image != "") {
      $html .= '<img alt="" class="taskboard-user-image" src="data/image/user/' . $task->user_image . '">';
    }
    if ($task->user_name != "") {
      $html .= '<p class="task-assign-name">' . $task->user_name . '</p>';
    }
    $html .='</div></div><div class="row-fluid"><span class="span3 badge badge-info">';
    $html .= $task->time_estimate . 'd';
    $html .= '</span><div class="span9 progress progress-info">';
    $html .= '<div class="bar" style="width: ' . $task->progress . '%">' . $task->progress . '%</div>';
    $html .= '</div></div></div>';
    return $html;
  }

  function getStoryProgress($sid) {
    $task = new Task;
    $task_in_story = $task->getTaskInStory($sid);
    $total_time_estimate = 0;
    $total_time_remain = 0;
    $progress = 0;
    foreach ($task_in_story as $task) {
      $total_time_estimate += $task->time_estimate;
      $total_time_remain += $task->time_remain;
    }
    if ($total_time_estimate != 0) {
      $progress = 100 - floor(($total_time_remain / $total_time_estimate) * 100);
    }
    return $progress;
  }

  public function reloadStoryProgress($sid) {
    $progress = $this->getStoryProgress($sid);
    $html = '<div class="bar" style="width: ' . $progress . '%">' . $progress . '%</div>';
    return $html;
  }

}
