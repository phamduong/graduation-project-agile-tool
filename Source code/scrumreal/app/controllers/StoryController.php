<?php

class StoryController extends BaseController {

  public function index() {
    if (Session::has('current_project')) {
      $data = array();
      $user = new User;
      $data['lang'] = parent::getLanguage();
      $data['cur_user'] = parent::getCurrentUser();
      $data['active_nav'] = 'story';
//      $data['current_proj_name'] = Project::find(Session::get('current_project'))->name;
      $data['current_proj_name'] = Session::get('current_project_nm');
      $data['current_role'] = Session::get('current_role');
      $data['current_project'] = Session::get('current_project');
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
      ActivityController::createActivityCreate($story->sid, ENTITY_STORY);
      $data['status'] = 200;
      $data['message'] = 'Add new user story successfully';
      $data['sid'] = $story->sid;
      $broadcast_data = array(
          'category' => 'scrum.realtime_' . Session::get('current_project') . '.story',
          'type' => 'add',
          'time' => date('H:i:s'),
          'content' => array(
              'sid' => $story->sid,
              'name' => $input['name']
          )
      );
      PushController::publishData($broadcast_data);
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
      $data['attachment'] = AttachController::getAttach(ENTITY_STORY, $sid);
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
        $broadcast_data = array(
            'category' => 'scrum.realtime_' . Session::get('current_project') . '.story',
            'type' => 'approve',
            'time' => date('H:i:s'),
            'content' => $story->getStory($sid)
        );
        PushController::publishData($broadcast_data);
      }
    }
//    $story
    return $data;
  }

  /**
   * Delete a story
   * @return int
   */
  public function delete() {
    $input = Input::all();
    $data = array('status' => 800, 'message' => 'Delete story unsucessfully');
    if (isset($input['sid'])) {
      $sid = $input['sid'];
      $story = Story::find($sid);
      $story->delete_flg = 1;
      if ($story->save()) {
        //Create an activity for current project
        ActivityController::createActivityDelete(Session::get('current_project'), ENTITY_PROJECT, $story->sid, ENTITY_STORY);
        $data = array('status' => 200, 'message' => 'Appoved sucessfully');
        $broadcast_data = array(
            'category' => 'scrum.realtime_' . Session::get('current_project') . '.story',
            'type' => 'delete',
            'time' => date('H:i:s'),
            'content' => array(
                'sid' => $story->sid,
                'name' => $story->name
            )
        );
        PushController::publishData($broadcast_data);
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
      if ($story->$key != $input[$key]) {
        ActivityController::createActivityUpdate($input['sid'], ENTITY_STORY, $value, $story->$key, $input[$key]);
        $story->$key = $input[$key];
      }
    }
    //Update status if user input time estimate and story point
    if ($story->time_estimate != 0 && $story->point != 0) {
      $story->status = STORY_STATUS_ESTIMATED;
    }else if ($story->time_estimate == 0 && $story->point == 0){
      $story->status = STORY_STATUS_APPROVED;
    }
    
    if ($story->save()) {
      $data = array('status' => 200, 'message' => 'Save sucessfully');
      $story_model = new Story;
      $broadcast_data = array(
          'category' => 'scrum.realtime_' . Session::get('current_project') . '.story',
          'type' => 'update',
          'time' => date('H:i:s'),
          'content' => $story_model->getStory($story->sid)
      );
      PushController::publishData($broadcast_data);
    }
    return $data;
  }

}
