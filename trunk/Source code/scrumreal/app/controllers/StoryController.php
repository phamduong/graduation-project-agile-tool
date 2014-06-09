<?php

class StoryController extends BaseController {

  public function index() {
    if (Session::has('current_project')) {
      $data = array();
      $user = new User;
      $data['lang'] = parent::getLanguage();
      $data['cur_user'] = parent::getCurrentUser();
      $data['active_nav'] = 'story';
      $data['current_proj_name'] = Session::get('current_project_nm');
      return View::make('story', $data);
    } else {
      return Redirect::to('/project');
    }
  }

  public function getDataTables() {
    $story = new Story;
    $data = $story->getStoryDatatables(Session::get('current_project'));
    return json_encode($data);
  }

  public function add() {
    $data = array();
    $input = Input::all();
    $story = new Story;
    $story->name = $input['name'];
    $story->priority = $input['priority'];
    $story->demo = $input['demo'];
    $story->description = $input['description'];
    $story->status = STORY_STATUS_NEW;
    $story->pid = Session::get('current_project');
    $story->create_user = Auth::user()->uid;
    if ($story->save() == 1) {
      //Add new activity to project
      ActivityController::createActivityAdd(Session::get('current_project'), ENTITY_PROJECT, $story->sid, ENTITY_STORY);
      $data['status'] = 200;
      $data['message'] = 'Add new user story successfully';
    } else {
      $data['status'] = 800;
      $data['message'] = 'Error';
    }
    return $data;
  }

  public function edit() {
    $input = Input::all();
    if (isset($input['sid'])) {
      $sid = $input['sid'];
      $story = new Story;
      $comment = new Comment;
      $data['story_info'] = $story->getStory($sid);
      //Get comment
      $data['comment'] = $comment->getComment($sid, ENTITY_STORY);
      $data['status'] = 200;
      $data['message'] = '';
    }
    return $data;
  }

  /**
   * Approve story
   * @return string
   */
  public function approve() {
    $input = Input::all();
    $data = array('status' => 800, 'message' => 'Appoved unsucessfully');
    if (isset($input['sid'])) {
      $sid = $input['sid'];
      $story = new Story;
      if ($story->approveStory($sid)) {
        //Create activity update for current project
        ActivityController::createActivityUpdate(Session::get('current_project'), ENTITY_PROJECT, 'Status', 'New', 'Approved');
        $data = array('status' => 200, 'message' => 'Appoved sucessfully');
      }
    }
    return $data;
  }

  /**
   * Delete a story
   * @return int
   */
  public function delete() {
    $input = Input::all();
    $data = array('status' => 800, 'message' => 'Appoved unsucessfully');
    if (isset($input['sid'])) {
      $sid = $input['sid'];
      $story = Story::find($sid);
      $story->delete_flg = 1;
      if ($story->save()) {
        //Create an activity for current project
        ActivityController::createActivityDelete(Session::get('current_project'), ENTITY_PROJECT, $story->sid, ENTITY_STORY);
        $data = array('status' => 200, 'message' => 'Appoved sucessfully');
      }
    }
    return $data;
  }

  public function save() {
    $input = Input::all();
    $data = array('status' => 800, 'message' => 'Save unsucessfully');
    $story = Story::find($input['sid']);
    $arr_match = array(
        'name' => 'Name',
        'priority' => 'Priority',
        'time_estimate' => 'Estimate time',
        'point' => 'Story point',
        'demo' => 'Demo',
        'description' => 'Description'
    );
    foreach ($arr_match as $key => $value) {
      if($story->$key != $input[$key]){
        ActivityController::createActivityUpdate($input['sid'], ENTITY_STORY, $value, $story->$key, $input[$key]);
        $story->$key = $input[$key];
      }
    }
//    $story->name = $input['name'];
//    $story->priority = $input['priority'];
//    $story->time_estimate = $input['time_estimate'];
//    $story->point = $input['point'];
//    $story->demo = $input['demo'];
//    $story->description = $input['description'];
    if ($story->save()) {
      $data = array('status' => 200, 'message' => 'Save sucessfully');
    }
    return $data;
  }

}
