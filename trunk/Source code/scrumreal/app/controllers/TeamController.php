<?php

class TeamController extends BaseController {

  public function index() {
    if (Session::has('current_project')) {
      $data = array();
      $user = new User;
      $team = new Team;
      $current_project = Session::get('current_project');
      //Common data
      $data['lang'] = parent::getLanguage();
      $data['cur_user'] = parent::getCurrentUser();
      $data['active_nav'] = 'people';
      $data['role'] = parent::getRole();
      $data['free_user'] = $user->getNotInProject();
      $data['team_list'] = $team->getTeamList($current_project);
      foreach ($data['team_list'] as $item) {
        $data['team_members'][$item->tid] = $team->getTeamMembers($item->tid, $current_project);
      }
      return View::make('people', $data);
    } else {
      return Redirect::to('/project');
    }
  }

  /**
   * Add new team
   * @return int
   */
  public function addTeam() {
    $input = Input::all();
    $team = new Team;
    $project = new Project;
    $team->name = $input['name'];
    $pid = Session::get('current_project');
    $team->pid = $pid;
    $team->description = $input['description'];
    if ($team->save() == 1) {
      //Insert user to project_user table
      if ($project->addToProject($pid, $input['master'], $team->tid, ROLE_SCRUM_MASTER)) {
        $data = array('status' => 200, 'message' => 'Add team successfully!');
      }
    } else {
      $data = array('status' => 800, 'message' => 'Error!');
    }
    return $data;
  }

  public function removeFromProject() {
    $input = Input::all();
    $team = new Team;
    if ($team->removeFromProject(Session::get('current_project'), $input['select_uid']) != 0) {
      $data = array('status' => 200, 'message' => 'Successfull');
    } else {
      $data = array('status' => 800, 'message' => 'Error!');
    }
    return $data;
  }

  /**
   * Add new member to team in project
   * @return int
   */
  public function addToProject() {
    $input = Input::all();
    $team = new Team;
    if ($team->addToProject(Session::get('current_project'), $input['select_uid'], $input['end_tid'], ROLE_MEMBER) != 0) {
      $data = array('status' => 200, 'message' => 'Successfull');
    } else {
      $data = array('status' => 800, 'message' => 'Error!');
    }
    return $data;
  }

  public function moveToTeam() {
    $input = Input::all();
    $team = new Team;
    if ($team->moveToTeam(Session::get('current_project'), $input['select_uid'], $input['end_tid'])) {
      $data = array('status' => 200, 'message' => 'Successfull');
    } else {
      $data = array('status' => 800, 'message' => 'Error!');
    }
    return $data;
  }

  public function editTeam() {
    $input = Input::all();
    if (isset($input['tid'])) {
      $tid = $input['tid'];
      $team = new Team;
      $comment = new Comment;
      $data['team_info'] = $team->getTeam(Session::get('current_project'), $tid);
      $data['comment'] = $comment->getComment($tid, ENTITY_TEAM);
      $data['status'] = 200;
      $data['message'] = '';
    }
    return $data;
  }

}
