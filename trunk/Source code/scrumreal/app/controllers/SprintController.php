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
      $data['current_project'] = $current_project;
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
      $data['story_status_name'] = array(
          STORY_STATUS_NEW => "New",
          STORY_STATUS_APPROVED => "Approved",
          STORY_STATUS_ESTIMATED => "Estimated",
          STORY_STATUS_ASIGNED => "Assigned",
          STORY_STATUS_TO_DO => "To do",
          STORY_STATUS_IN_PROGRESS => "In progress",
          STORY_STATUS_TO_TEST => "To test",
          STORY_STATUS_DONE => "Done",
          STORY_STATUS_SPRINT_COMPLETED => "Sprint completed"
      );
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
    $date = explode(" - ", $input['sprint_time']);
    $start_date_es = date('Y-m-d', strtotime($date[0]));
    $end_date_es = date('Y-m-d', strtotime($date[1]));
    $sprint_model = new Sprint;
    $max_end_date_es = $sprint_model->getMaxEndDate(Session::get('current_project'));
    $date1 = new DateTime($start_date_es);
    $date2 = new DateTime($max_end_date_es);
    if ($date1 < $date2) {
      $data = array('status' => 802, 'message' => 'Start date in progress of other sprint, please check again!');
    } else {
      $sprint = new Sprint;
      $sprint->pid = Session::get('current_project');
      $sprint->name = $input['name'];
      $sprint->description = $input['description'];
      $sprint->start_date_es = $start_date_es;
      $sprint->end_date_es = $end_date_es;
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
        ActivityController::createActivityCreate($sprint->spid, ENTITY_SPRINT);


        $broadcast_data = array(
            'category' => 'scrum.realtime_' . Session::get('current_project') . '.sprint',
            'type' => 'add_sprint',
            'time' => date('H:i:s'),
            'content' => $sprint_model->getSprintDetail($sprint->spid)
        );
        PushController::publishData($broadcast_data);
      } else {
        $data = array('status' => 800, 'message' => 'Error!');
      }
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
    //Update story status when assign to Sprint
    $story = Story::find($input['select_sid']);
    if($story->status < STORY_STATUS_ASIGNED){
      $story->status = STORY_STATUS_ASIGNED;
    }
    $story->save();
    if ($result != 0) {
      //activity
      ActivityController::createActivityAdd($input['end_spid'], ENTITY_SPRINT, $input['select_sid'], ENTITY_STORY);
      ActivityController::createActivityAdd($input['end_tid'], ENTITY_TEAM, $input['select_sid'], ENTITY_STORY);
      $data = array('status' => 200, 'message' => 'Successfull');
      $story_model = new Story;
      $broadcast_data = array(
          'category' => 'scrum.realtime_' . Session::get('current_project') . '.sprint',
          'type' => 'add_story_to',
          'time' => date('H:i:s'),
          'content' => array(
              'select_sid' => $input['select_sid'],
              'end_spid' => $input['end_spid'],
              'end_tid' => $input['end_tid'],
              'order' => $input['order'],
              'story_data' => $story_model->getStory($input['select_sid'])
          )
      );
      PushController::publishData($broadcast_data);
    } else {
      $data = array('status' => 800, 'message' => 'Error!');
    }
    return $data;
  }

  public function removeStory() {
    $input = Input::all();
    $sprint = new Sprint;
    $result = $sprint->removeStoryFromSprint($input['select_sid'], $input['start_spid'], $input['start_tid']);
    $story = Story::find($input['select_sid']);
    $story->status = STORY_STATUS_ESTIMATED;
    $story->save();
    if ($result != 0) {
      //activity
      ActivityController::createActivityDelete($input['start_spid'], ENTITY_SPRINT, $input['select_sid'], ENTITY_STORY);
      ActivityController::createActivityDelete($input['start_tid'], ENTITY_TEAM, $input['select_sid'], ENTITY_STORY);
      $data = array('status' => 200, 'message' => 'Successfull');
      $story_model = new Story;
      $broadcast_data = array(
          'category' => 'scrum.realtime_' . Session::get('current_project') . '.sprint',
          'type' => 'remove_story_from',
          'time' => date('H:i:s'),
          'content' => array(
              'select_sid' => $input['select_sid'],
              'start_spid' => $input['start_spid'],
              'start_tid' => $input['start_tid'],
              'story_data' => $story_model->getStory($input['select_sid'])
          )
      );
      PushController::publishData($broadcast_data);
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
      $story_model = new Story;
      $broadcast_data = array(
          'category' => 'scrum.realtime_' . Session::get('current_project') . '.sprint',
          'type' => 'move_story',
          'time' => date('H:i:s'),
          'content' => array(
              'select_sid' => $input['select_sid'],
              'start_spid' => $input['start_spid'],
              'start_tid' => $input['start_tid'],
              'end_spid' => $input['end_spid'],
              'end_tid' => $input['end_tid'],
              'story_data' => $story_model->getStory($input['select_sid'])
          )
      );
      PushController::publishData($broadcast_data);
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
    $broadcast_data = array(
        'category' => 'scrum.realtime_' . Session::get('current_project') . '.sprint',
        'type' => 'update_story_order',
        'time' => date('H:i:s'),
        'content' => array(
            'spid' => $input['spid'],
            'tid' => $input['tid'],
            'list_sid' => $input['data']
        )
    );
    PushController::publishData($broadcast_data);
    return $data;
  }

  public function save() {
    $input = Input::all();
    $sprint = Sprint::find($input['spid']);

    $arr_match = array(
        'name' => 'Name',
        'description' => 'Description',
        'start_date_es' => 'Start date estimate',
        'end_date_es' => 'End date estimate'
    );

    $date = explode(" - ", $input['sprint_time']);
    $input['start_date_es'] = date('Y-m-d', strtotime($date[0]));
    $input['end_date_es'] = date('Y-m-d', strtotime($date[1]));

    foreach ($arr_match as $key => $value) {
      if ($sprint->$key != $input[$key]) {
        ActivityController::createActivityUpdate($input['spid'], ENTITY_SPRINT, $value, $sprint->$key, $input[$key]);
        $sprint->$key = $input[$key];
      }
    }

    if ($sprint->save() == 1) {
      $data = array('status' => 200, 'message' => 'Save sprint successfully!');
      $sprint_model = new Sprint;
      $broadcast_data = array(
          'category' => 'scrum.realtime_' . Session::get('current_project') . '.sprint',
          'type' => 'update_sprint',
          'time' => date('H:i:s'),
          'content' => $sprint_model->getSprintDetail($input['spid'])
      );
      PushController::publishData($broadcast_data);
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
        $sprint_model->updateStoryStatusInSprint($spid, STORY_STATUS_TO_DO);
        $data = array('status' => 200, 'message' => 'Start sprint successfully');
        $broadcast_data = array(
            'category' => 'scrum.realtime_' . Session::get('current_project') . '.sprint',
            'type' => 'start_sprint',
            'time' => date('H:i:s'),
            'content' => array(
                'spid' => $spid
            )
        );
        PushController::publishData($broadcast_data);
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
      //remove uncomplete story form this sprint
      $sprint_model = new Sprint;
      $sprint_model->removeUnCompletedStory($spid);
      $data = array('status' => 200, 'message' => 'Start sprint successfully');
      $broadcast_data = array(
          'category' => 'scrum.realtime_' . Session::get('current_project') . '.sprint',
          'type' => 'complete_sprint',
          'time' => date('H:i:s'),
          'content' => array(
              'spid' => $spid
          )
      );
      PushController::publishData($broadcast_data);
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
        $broadcast_data = array(
            'category' => 'scrum.realtime_' . Session::get('current_project') . '.sprint',
            'type' => 'resume_sprint',
            'time' => date('H:i:s'),
            'content' => array(
                'spid' => $spid
            )
        );
        PushController::publishData($broadcast_data);
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
      $broadcast_data = array(
          'category' => 'scrum.realtime_' . Session::get('current_project') . '.sprint',
          'type' => 'delete_sprint',
          'time' => date('H:i:s'),
          'content' => array(
              'spid' => $spid
          )
      );
      PushController::publishData($broadcast_data);
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
      $broadcast_data = array(
          'category' => 'scrum.realtime_' . Session::get('current_project') . '.sprint',
          'type' => 'update_team_day',
          'time' => date('H:i:s'),
          'content' => array(
              'spid' => $input['spid'],
              'tid' => $input['tid'],
              'num_day' => $input['num_day']
          )
      );
      PushController::publishData($broadcast_data);
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
