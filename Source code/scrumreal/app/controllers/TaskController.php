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
      }
      $data['selected_sprint'] = $spid;
      $data['sprint_status'] = Sprint::find($spid)->status;
      $data['current_project'] = Session::get('current_project');
      //Get story in sprint
      //IF GET BY TEAM -> get all stories for that team in current sprint
      if ($entity_type === 'team') {
        $data['story_in_sprint'] = $task->getStoryTaskByTeam($spid, $entity_id);
        $data['selected_team'] = $entity_id . '_team';
      } else {
        $data['story_in_sprint'] = $task->getStoryTask($spid);
      }
      //Get selected sprint status
      $sprint_status = array(
          SPRINT_STATUS_IN_PLAN => 'Planning',
          SPRINT_STATUS_IN_PROGRESS => 'In progress',
          SPRINT_STATUS_COMPLETED => 'Completed'
      );
      $sp = Sprint::find($data['selected_sprint']);
      $data['selected_sprint_status'] = $sprint_status[$sp->status];
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
      ActivityController::createActivityCreate($task->taid, ENTITY_TASK);
      //If number of day in task exceed number of date for sprint, update sprint estimate day
      //NO NEED: because task is done by 1 person, but story is done by many people
      $task_model = new Task;
//      $same_story = $task_model->getTaskInStory($input['sid']);
//      $num_day = 0;
//      foreach ($same_story as $t) {
//        $num_day += $t->time_estimate;
//      }
      $story_contain = Story::find($input['sid']);
//      if ($num_day != $story_contain->time_estimate) {
//        $story_contain->time_estimate = $num_day;
//      }
      //update story contain task status tu TO DO
      $story_contain->status = STORY_STATUS_TO_DO;

      if ($story_contain->save()) {
        $data = array('status' => 200, 'message' => '');
        $task_data = $task_model->getTaskDetail($task->taid);
        if ($task_data->user_image != "") {
          $task_data->user_image_path = asset('data/image/user/' . $task_data->user_image);
        }
        $task_data->progress = 0;
        $broadcast_data = array(
            'category' => 'scrum.realtime_' . Session::get('current_project') . '.task',
            'type' => 'add_task',
            'time' => date('H:i:s'),
            'content' => array(
                'taid' => $task->taid,
                'task_data' => $task_data
            )
        );
        PushController::publishData($broadcast_data);

        $story_model = new Story;
        $broadcast_data_2 = array(
            'category' => 'scrum.realtime_' . Session::get('current_project') . '.story',
            'type' => 'update',
            'time' => date('H:i:s'),
            'content' => $story_model->getStory($input['sid'])
        );
        PushController::publishData($broadcast_data_2);
      }
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
    if ($task->name != $input['name']) {
      //activity
      ActivityController::createActivityUpdate($input['taid'], ENTITY_TASK, 'Name', $task->name, $input['name']);
      $task->name = $input['name'];
    }
    if ($task->time_estimate != $input['time_estimate']) {
      //activity
      ActivityController::createActivityUpdate($input['taid'], ENTITY_TASK, 'Estimate time', $task->time_estimate, $input['time_estimate']);
      $task->time_estimate = $input['time_estimate'];
    }
    if ($task->description != $input['description']) {
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
      if ($task->uid != $input['uid']) {
//        echo $task->uid;
//        echo $input['uid'];
//        exit();
        $new_user = User::find($input['uid'])->fullname;
        $old_user = User::find($task->uid);
        if ($old_user != null) {
          $old_name = $old_user->fullname;
          ActivityController::createActivityUpdate($input['taid'], ENTITY_TASK, 'User assign', $old_name, $new_user);
        }
        $task->uid = $input['uid'];
      }
    }
    if ($task->save()) {
      //If number of day in task exceed number of date for sprint, update sprint estimate day
      $task_model = new Task;
      $same_story = $task_model->getTaskInStory($task->sid);
      $num_day = 0;
      foreach ($same_story as $t) {
        $num_day += $t->time_estimate;
      }
      $story_contain = Story::find($task->sid);
      if ($num_day != $story_contain->time_estimate) {
        $story_contain->time_estimate = $num_day;
      }
      if ($story_contain->save()) {
        $data = array('status' => 200, 'message' => '');
        $task_model = new Task;
        $broadcast_data = array(
            'category' => 'scrum.realtime_' . Session::get('current_project') . '.task',
            'type' => 'update_task',
            'time' => date('H:i:s'),
            'content' => array(
                'taid' => $input['taid'],
                'task_data' => $task_model->getTaskDetail($input['taid']
                )
            )
        );
        PushController::publishData($broadcast_data);
      }
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
    if ($task->status != $input['status']) {
      ActivityController::createActivityUpdate($task->taid, ENTITY_TASK, 'Status', $task_status[$task->status], $task_status[$input['status']]);
      $task->status = $input['status'];
    }
    if ($input['status'] >= 3) {
      $task->time_remain = 0;
    } else if ($input['status'] === 1) {
      $task->time_remain = $task->time_estimate;
    }

    if ($task->save()) {
      $task_model = new Task;
      //IF task id completed update finish date
      if ($input['status'] == 4) {
        //$task->finish_date = date('Y-m-d H:i:s');
        if ($task_model->updateTaskFinishDate($task->taid)) {
          $data = array('status' => 200, 'message' => '');
        }
      }
      $broadcast_data = array(
          'category' => 'scrum.realtime_' . Session::get('current_project') . '.task',
          'type' => 'move_task',
          'time' => date('H:i:s'),
          'content' => array(
              'taid' => $input['taid'],
              'old_status' => $input['old_status'],
              'new_status' => $input['status'],
              'task_data' => $task_model->getTaskDetail($input['taid'])
          )
      );
      PushController::publishData($broadcast_data);

      //update status of story that contains task
      $story = new Story;
      $story_info = $data['story'] = $story->updateStatusFollowTasks($task->sid);

      $broadcast_data_2 = array(
          'category' => 'scrum.realtime_' . Session::get('current_project') . '.story',
          'type' => 'update',
          'time' => date('H:i:s'),
          'content' => $story->getStory($story_info['sid'])
      );
      PushController::publishData($broadcast_data_2);
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
      $html .= '<img alt="" class="taskboard-user-image" src="/data/image/user/' . $task->user_image . '">';
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

  public function deleteTask() {
    $input = Input::all();
    $taid = $input['taid'];
    $task = Task::find($taid);
    $sid = $task->sid;
    $task->delete_flg = 1;
    if ($task->save()) {
      //create activity
      ActivityController::createActivityDelete($sid, ENTITY_STORY, $taid, ENTITY_TASK);
      $data = array('status' => 200, 'message' => 'Delete task successfully');
      $task_model = new Task;
      $broadcast_data = array(
          'category' => 'scrum.realtime_' . Session::get('current_project') . '.task',
          'type' => 'delete_task',
          'time' => date('H:i:s'),
          'content' => array(
              'taid' => $input['taid'],
              'task_data' => $task_model->getTaskDetail($input['taid'])
          )
      );
      PushController::publishData($broadcast_data);

      //update status of story that contains task
      $story = new Story;
      $story_info = $data['story'] = $story->updateStatusFollowTasks($sid);
      $broadcast_data_2 = array(
          'category' => 'scrum.realtime_' . Session::get('current_project') . '.story',
          'type' => 'update',
          'time' => date('H:i:s'),
          'content' => $story->getStory($story_info['sid'])
      );
      PushController::publishData($broadcast_data_2);
      
    } else {
      $data = array('status' => 800, 'message' => 'Error when delete task');
    }
    return $data;
  }

  public function updateTaskOrder() {
    $input = Input::all();
    $task_model = new Task;
    $task_model->updateTaskOrder($input['data']);
    $broadcast_data = array(
        'category' => 'scrum.realtime_' . Session::get('current_project') . '.task',
        'type' => 'update_task_order',
        'time' => date('H:i:s'),
        'content' => array(
            'sid' => $input['sid'],
            'status' => $input['status'],
            'list_taid' => $input['data']
        )
    );
    PushController::publishData($broadcast_data);
  }

}
