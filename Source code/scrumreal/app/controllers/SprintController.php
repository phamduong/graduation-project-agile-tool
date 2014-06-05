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
      $html .= '<div class="story-points badge badge-info">'.$story->point.' points</div>';
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
    $date = explode(" - ", $input['sprint_time']);
    $sprint->start_date = date('Y-m-d', strtotime($date[0]));
    $sprint->end_date = date('Y-m-d', strtotime($date[1]));
    $sprint->status = SPRINT_STATUS_IN_PLAN;
    if ($sprint->save() == 1) {
      $data = array('status' => 200, 'message' => 'Add sprint successfully!');
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
      $data = array('status' => 200, 'message' => 'Successfull');
    } else {
      $data = array('status' => 800, 'message' => 'Error!');
    }
  }

  public function removeStory() {
    $input = Input::all();
    $sprint = new Sprint;
    $result = $sprint->removeStoryFromSprint($input['select_sid'], $input['start_spid'], $input['start_tid']);
    if ($result != 0) {
      $data = array('status' => 200, 'message' => 'Successfull');
    } else {
      $data = array('status' => 800, 'message' => 'Error!');
    }
  }

  public function moveStory() {
    $input = Input::all();
    $sprint = new Sprint;
    $result = $sprint->moveStoryToSrpint($input['end_tid'], $input['end_spid'], $input['order'], $input['select_sid'], $input['start_tid'], $input['start_spid']);
    if ($result != 0) {
      $data = array('status' => 200, 'message' => 'Successfull');
    } else {
      $data = array('status' => 800, 'message' => 'Error!');
    }
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
    $sprint->pid = Session::get('current_project');
    $sprint->name = $input['name'];
    $sprint->description = $input['description'];
    $date = explode(" - ", $input['sprint_time']);
    $sprint->start_date = date('Y-m-d', strtotime($date[0]));
    $sprint->end_date = date('Y-m-d', strtotime($date[1]));
    if ($sprint->save() == 1) {
      $data = array('status' => 200, 'message' => 'Save sprint successfully!');
    } else {
      $data = array('status' => 800, 'message' => 'Error!');
    }
    return $data;
  }

}
