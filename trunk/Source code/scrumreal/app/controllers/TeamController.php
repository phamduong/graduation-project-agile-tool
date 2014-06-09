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
        //Create activity
        ActivityController::createActivityAdd(Session::get('current_project'), ENTITY_PROJECT, $team->tid, ENTITY_TEAM);
      }
    } else {
      $data = array('status' => 800, 'message' => 'Error!');
    }
    return $data;
  }

  public function delete() {
    $input = Input::all();
    $tid = $input['tid'];
    $team = Team::find($tid);
    $team->delete_flg = 1;
    if ($team->save()) {
      //Create activity
      ActivityController::createActivityDelete(Session::get('current_project'), ENTITY_PROJECT, $team->tid, ENTITY_TEAM);
      $data = array('status' => 200, 'message' => 'Successfull');
    } else {
      $data = array('status' => 800, 'message' => 'Error!');
    }
    return $data;
  }

  public function removeFromProject() {
    $input = Input::all();
    $team = new Team;
    if ($team->removeFromProject(Session::get('current_project'), $input['select_uid']) != 0) {
      //activity
      ActivityController::createActivityDelete($input['tid'], ENTITY_TEAM, $input['select_uid'], ENTITY_USER);
      $data = array('status' => 200, 'message' => 'Successfull');
    } else {
      $data = array('status' => 800, 'message' => 'Error!');
    }
    return $data;
  }

  /**
   * Update team
   * @return int
   */
  public function save() {
    $input = Input::all();
    $team = Team::find($input['tid']);
    $arr_match = array(
        'name' => 'Name',
        'description' => 'Description'
    );
    foreach ($arr_match as $key => $value) {
      if ($team->$key != $input[$key]) {
        ActivityController::createActivityUpdate($input['tid'], ENTITY_TEAM, $value, $team->$key, $input[$key]);
        $team->$key = $input[$key];
      }
    }
    $team_model = new Team;
    $temp = $team_model->getTeam(Session::get('current_project'), $input['tid']);
    if ($temp->master_id != $input['master']) {
      $new_master_name = User::find($input['master'])->fullname;
      ActivityController::createActivityUpdate($input['tid'], ENTITY_TEAM, 'Master', $temp->master_name, $new_master_name);
      $team_model->updateMaster(Session::get('current_project'), $input['tid'], $input['master']);
    }

    if ($team->save()) {
      $data = array('status' => 200, 'message' => 'Save team sucessfully');
    } else {
      $data = array('status' => 800, 'message' => 'Save team unsucessfully');
    }
    return $data;
  }

  public function reloadTeamData($tid) {
    $team_model = new Team;
    $team = $team_model->getTeam(Session::get('current_project'), $tid);
    $team_member = $team_model->getTeamMembers($tid, Session::get('current_project'));
    $html = '';
    $html .= '<div class="box box-color teal box-small box-bordered"><div class="box-title"><h3><i class="glyphicon-group"></i>';
    $html .= '<a href="' . $team->tid . '" class="team-name">' . $team->name . '</a>';
    $html .= '</h3><div class="actions"></div></div><div class="box-content"><div class="team-members">';
    $html .= '<div data-name="'.$team->master_name.'" data-value="'.$team->master_id.'" class="leader ui-draggable">';
    $html .= '<img src="data/image/user/' . $team->master_image . '" alt="">';
    $html .= '<p class="person-name">'.$team->master_name.'</p></div>';
    foreach ($team_member as $mem) {
      $html .= '<div data-uid="' . $mem->uid . '"  data-name="' . $mem->fullname . '" id="member_' . $mem->uid . '" class="person ui-draggable">';
      $html .= '<img src="data/image/user/' . $mem->image . '" alt="">';
      $html .= '<p class="person-name">' . $mem->fullname . '</p></div>';
    }
    $html .= '</div></div></div>';
    return $html;
  }

  /**
   * Add new member to team in project
   * @return int
   */
  public function addToProject() {
    $input = Input::all();
    $team = new Team;
    if ($team->addToProject(Session::get('current_project'), $input['select_uid'], $input['end_tid'], ROLE_MEMBER) != 0) {
      //activity
      ActivityController::createActivityAdd($input['end_tid'], ENTITY_TEAM, $input['select_uid'], ENTITY_USER);
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
      //activity
      ActivityController::createActivityDelete($input['start_tid'], ENTITY_TEAM, $input['select_uid'], ENTITY_USER);
      ActivityController::createActivityAdd($input['end_tid'], ENTITY_TEAM, $input['select_uid'], ENTITY_USER);
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

  public function reloadListStaff() {
    $user = new User;
    $free_user = $user->getNotInProject();
    $html = '';
    foreach ($free_user as $user) {
      $html .= '<div id="member_' . $user->uid . '?>" class="person" data-uid="' . $user->uid . '" data-name="' . $user->fullname . '">';
      $html .= '<img alt="" src="data/image/user/' . $user->image . '">';
      $html .= '<p class="person-name">' . $user->fullname . '</p></div>';
    }
    return $html;
  }

}
