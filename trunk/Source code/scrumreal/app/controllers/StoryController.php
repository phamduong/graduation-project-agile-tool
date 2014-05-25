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
//      $data['story_info'] = $story->getStory();
      //Get comment
      $data['comment'] = $comment->getComment($sid, ENTITY_STORY);
      $data['status'] = 200;
      $data['message'] = '';
    }
    return $data;
  }

}
