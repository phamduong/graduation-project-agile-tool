<?php

class SprintController extends BaseController {

  public function index() {
    if (Session::has('current_project')) {
      $data = array();
      $user = new User;
      $sprint = new Sprint;
      $team = new Team;
      $current_project = Session::get('current_project');
      //Common data
      $data['lang'] = parent::getLanguage();
      $data['cur_user'] = parent::getCurrentUser();
      $data['active_nav'] = 'sprint';
      //page data
      $data['story_not_asign'] = $sprint->getStoryNotAssign($current_project);
      $data['sprint_list'] = $sprint->getSprintInProject($current_project);
//      var_dump($data['sprint_list']);
//      exit();
      $data['has_sprint_running'] = false;
      foreach ($data['sprint_list'] as $sp) {
        if ($sp->status == SPRINT_STATUS_IN_PROGRESS) {
          $data['has_sprint_running'] = true;
          break;
        }
      }
      $data['team_list'] = $team->getTeamOnProject($current_project);
      foreach ($data['sprint_list'] as $item1) {
        foreach ($data['team_list'] as $item2) {
          $data['story_list'][$item1->spid][$item2->tid] = $sprint->getStoryInSprint($item1->spid, $item2->tid);
        }
      }
//      print '<pre>';
//      print_r($data);
//      exit();
      return View::make('sprint', $data);
    } else {
      return Redirect::to('/project');
    }
  }

  public function reloadStoryList() {
    $current_project = Session::get('current_project');
    $sprint = new Sprint;
    $story_not_asign = $sprint->getStoryNotAssign($current_project);
    $html = "";
    foreach ($story_not_asign as $story) {
      if ($story->time_estimate == null) {
        $html .= '<div id="story_' . $story->sid . '" data-sid="' . $story->sid . '" class="story story-unaddable" data-name="' . $story->name . '" data-order="">';
      } else {
        $html .= '<div id="story_' . $story->sid . '" data-sid="' . $story->sid . '" class="story story-addable" data-name="' . $story->name . '" data-order="">';
      }
      $html .= '<div class="story-name"><a href="' . $story->sid . '" class="edit-story">' . $story->name . '</a></div>';
      $html .= '<div class="story-points badge badge-info">' . $story->point . ' points</div>';
      $html .= '</div></div>';
    }
    return $html;
  }

  public function add() {
    $input = Input::all();
    $sprint = new Sprint;
    $sprint->pid = Session::get('current_project');
    $sprint->name = $input['name'];
    $sprint->description = $input['description'];
//    $date = explode(" - ", $input['sprint_time']);
//    $sprint->start_date = date('Y-m-d', strtotime($date[0]));
//    $sprint->end_date = date('Y-m-d', strtotime($date[1]));
//    $sprint->num_day = $input['num_day'];
    $sprint->status = SPRINT_STATUS_IN_PLAN;
    if ($sprint->save() == 1) {
      $data = array('status' => 200, 'message' => 'Add sprint successfully!');
      //add to sprint_team table 
      $team_model = new Team;
      $team_list = $team_model->getTeamOnProject(Session::get('current_project'));
      foreach ($team_list as $t) {
        $team_model->addToSprint_Team($sprint->spid, $t->tid);
      }
      //activity
      ActivityController::createActivityAdd(Session::get('current_project'), ENTITY_PROJECT, $sprint->spid, ENTITY_SPRINT);
    } else {
      $data = array('status' => 800, 'message' => 'Error!');
    }
    return $data;
  }

  public function edit() {
    $input = Input::all();
    if (isset($input['spid'])) {
      $spid = $input['spid'];
      $sprint = new Sprint;
      $comment = new Comment;
      $data['status'] = 200;
      $data['sprint_info'] = $sprint->getSprintDetail($spid);
      $data['comment'] = $comment->getComment($spid, ENTITY_SPRINT);
    }
    return $data;
  }

  public function addStory() {
    $input = Input::all();
    $sprint = new Sprint;
    $result = $sprint->addStoryToSprint($input['select_sid'], $input['end_spid'], $input['end_tid'], $input['order']);
    if ($result != 0) {
      //activity
      ActivityController::createActivityAdd($input['end_spid'], ENTITY_SPRINT, $input['select_sid'], ENTITY_STORY);
      ActivityController::createActivityAdd($input['end_tid'], ENTITY_TEAM, $input['select_sid'], ENTITY_STORY);
      $data = array('status' => 200, 'message' => 'Successfull');
    } else {
      $data = array('status' => 800, 'message' => 'Error!');
    }
    return $data;
  }

  public function removeStory() {
    $input = Input::all();
    $sprint = new Sprint;
    $result = $sprint->removeStoryFromSprint($input['select_sid'], $input['start_spid'], $input['start_tid']);
    if ($result != 0) {
      //activity
      ActivityController::createActivityDelete($input['start_spid'], ENTITY_SPRINT, $input['select_sid'], ENTITY_STORY);
      ActivityController::createActivityDelete($input['start_tid'], ENTITY_TEAM, $input['select_sid'], ENTITY_STORY);
      $data = array('status' => 200, 'message' => 'Successfull');
    } else {
      $data = array('status' => 800, 'message' => 'Error!');
    }
    return $data;
  }

  public function moveStory() {
    $input = Input::all();
    $sprint = new Sprint;
    $result = $sprint->moveStoryToSrpint($input['end_tid'], $input['end_spid'], $input['order'], $input['select_sid'], $input['start_tid'], $input['start_spid']);
    if ($result != 0) {
      //activity
      ActivityController::createActivityAdd($input['end_spid'], ENTITY_SPRINT, $input['select_sid'], ENTITY_STORY);
      ActivityController::createActivityAdd($input['end_tid'], ENTITY_TEAM, $input['select_sid'], ENTITY_STORY);

      ActivityController::createActivityDelete($input['start_spid'], ENTITY_SPRINT, $input['select_sid'], ENTITY_STORY);
      ActivityController::createActivityDelete($input['start_tid'], ENTITY_TEAM, $input['select_sid'], ENTITY_STORY);

      $data = array('status' => 200, 'message' => 'Successfull');
    } else {
      $data = array('status' => 800, 'message' => 'Error!');
    }
    return $data;
  }

  public function updateStoryOrder() {
    $input = Input::all();
    $sprint = new Sprint;
    $sprint->updateStoryOrder($input['tid'], $input['spid'], $input['data']);
    $data = array('status' => 200, 'message' => 'Successfull');
    return $data;
  }

  public function save() {
    $input = Input::all();
    $sprint = Sprint::find($input['spid']);

    $arr_match = array(
        'name' => 'Name',
        'description' => 'Description'
    );

//    $date = explode(" - ", $input['sprint_time']);
//    $input['start_date'] = date('Y-m-d', strtotime($date[0]));
//    $input['end_date'] = date('Y-m-d', strtotime($date[1]));

    foreach ($arr_match as $key => $value) {
      if ($sprint->$key != $input[$key]) {
        ActivityController::createActivityUpdate($input['spid'], ENTITY_SPRINT, $value, $sprint->$key, $input[$key]);
        $sprint->$key = $input[$key];
      }
    }

//    $sprint->name = $input['name'];
//    $sprint->description = $input['description'];
//    $date = explode(" - ", $input['sprint_time']);
//    $sprint->start_date = date('Y-m-d', strtotime($date[0]));
//    $sprint->end_date = date('Y-m-d', strtotime($date[1]));

    if ($sprint->save() == 1) {
      $data = array('status' => 200, 'message' => 'Save sprint successfully!');
    } else {
      $data = array('status' => 800, 'message' => 'Error!');
    }
    return $data;
  }

  public function startSprint() {
    $input = Input::all();
    $spid = $input['spid'];
    $sprint = Sprint::find($spid);
    $sprint_model = new Sprint;
    $data = array('status' => 800, 'message' => 'Error!');
    //Check are there any sprint in progress
    if (count($sprint_model->getSprintByStatus(SPRINT_STATUS_IN_PROGRESS)) == 0) {
      $sprint->status = SPRINT_STATUS_IN_PROGRESS;
      $sprint->start_date = date('Y-m-d');
      if ($sprint->save()) {
        $data = array('status' => 200, 'message' => 'Start sprint successfully');
      }
    } else {
      $data = array('status' => 801, 'message' => 'There is sprint in progress');
    }
    return $data;
  }

  public function completeSprint() {
    $input = Input::all();
    $spid = $input['spid'];
    $sprint = Sprint::find($spid);
    $sprint->status = SPRINT_STATUS_COMPLETED;
    $sprint->end_date = date('Y-m-d');
    $data = array('status' => 800, 'message' => 'Error!');
    if ($sprint->save()) {
      $data = array('status' => 200, 'message' => 'Start sprint successfully');
    }
    return $data;
  }

  public function resumeSprint() {
    $input = Input::all();
    $spid = $input['spid'];
    $sprint = Sprint::find($spid);
    $sprint_model = new Sprint;
    $data = array('status' => 800, 'message' => 'Error!');
    //Check are there any sprint in progress
    if (count($sprint_model->getSprintByStatus(SPRINT_STATUS_IN_PROGRESS)) == 0) {
      $sprint->status = SPRINT_STATUS_IN_PROGRESS;
      if ($sprint->save()) {
        $data = array('status' => 200, 'message' => 'Resume sprint successfully');
      }
    } else {
      $data = array('status' => 802, 'message' => 'There is sprint in progress');
    }
    return $data;
  }

  public function delete() {
    $input = Input::all();
    $spid = $input['spid'];
    $sprint = Sprint::find($spid);
    $sprint->delete_flg = 1;
    if ($sprint->save()) {
      $data = array('status' => 200, 'message' => 'Delete sprint successfully');
      //remove from sprint_team table
      $team_model = new Team;
      $team_list = $team_model->getTeamOnProject(Session::get('current_project'));
      foreach ($team_list as $t) {
        $team_model->deleteFromSprint_Team($spid, $t->tid);
      }
      //remove from story_team table
      foreach ($team_list as $t) {
        $team_model->deleteFromStory_Team($spid, $t->tid);
      }

      ActivityController::createActivityDelete(Session::get('current_project'), ENTITY_PROJECT, $spid, ENTITY_SPRINT);
    } else {
      $data = array('status' => 800, 'message' => 'Error deleting sprint');
    }
    return $data;
  }

  public function getTeamDay() {
    $input = Input::all();
    $tid = $input['tid'];
    $spid = $input['spid'];
    $sprint_model = new Sprint;
    $data['data'] = $sprint_model->getTeamDay($spid, $tid);
    $data['status'] = 200;
    return $data;
  }

  public function updateTeamDay() {
    $input = Input::all();
    $sprint_model = new Sprint;
    if ($sprint_model->updateTeamDay($input['spid'], $input['tid'], $input['num_day']) > 0) {
      $data = array('status' => 200, 'message' => 'Update successfully!');
    } else {
      $data = array('status' => 800, 'message' => 'Fail!');
    }
    return $data;
  }

  public function getTeamDayAll() {
    $pid = Session::get('current_project');
    $sprint_model = new Sprint;
    $data = array('status' => 200);
    $data['data'] = $sprint_model->getTeamDayAll($pid);
    return $data;
  }

}
