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
      $data['free_user'] = $user->getNotInProject2();
      $data['team_list'] = $team->getTeamList($current_project);
      $data['current_project'] = Session::get('current_project');
      $data['current_proj_name'] = Session::get('current_project_nm');
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
    $team_model = new Team;
    if ($team->save() == 1) {
      //Insert user to project_user table
      if ($team_model->addToProject($pid, $input['master'], $team->tid, ROLE_SCRUM_MASTER)) {
        //add to table sprint_team
        $sprint = new Sprint;
        $sprint_in_proj = $sprint->getSprintInProject(Session::get('current_project'));
        $new_tid = $team->tid;
        foreach ($sprint_in_proj as $sp) {
          $team_model->addToSprint_Team($sp->spid, $new_tid);
        }
        //Create activity
        ActivityController::createActivityAdd(Session::get('current_project'), ENTITY_PROJECT, $team->tid, ENTITY_TEAM);
        ActivityController::createActivityCreate($new_tid, ENTITY_TEAM);
        $master = User::find($input['master']);
        $data = array(
            'status' => 200,
            'message' => 'Add team successfully!',
        );
        //get team leader data
        $master = User::find($input['master']);
        $broadcast_data = array(
            'category' => 'scrum.realtime_' . Session::get('current_project') . '.team',
            'type' => 'add',
            'time' => date('H:i:s'),
            'content' => array(
                'tid' => $team->tid,
                'team_name' => $team->name,
                'master_id' => $master->uid,
                'master_name' => $master->fullname,
                'master_image' => asset('data/image/user/' . $master->image)
            )
        );
        PushController::publishData($broadcast_data);
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
      //delete from table sprint_team
      $sprint = new Sprint;
      $team_model = new Team;
      $sprint_in_proj = $sprint->getSprintInProject(Session::get('current_project'));
      foreach ($sprint_in_proj as $sp) {
        $team_model->deleteFromSprint_Team($sp->spid, $tid);
      }
      //delete team leader from list user in projet
      $team_model->removeTeamLeaderFromProject(Session::get('current_project'), $tid);

      //delete from story_team folder
      foreach ($sprint_in_proj as $sp) {
        $team_model->deleteFromStory_Team($sp->spid, $tid);
      }

      //delete user in team from table project_user
      $team_model->removeTeamMemFromProject($tid);

      //Create activity
      ActivityController::createActivityDelete(Session::get('current_project'), ENTITY_PROJECT, $team->tid, ENTITY_TEAM);
      $data = array('status' => 200, 'message' => 'Successfull');
      $broadcast_data = array(
          'category' => 'scrum.realtime_' . Session::get('current_project') . '.team',
          'type' => 'delete',
          'time' => date('H:i:s'),
          'content' => array(
              'tid' => $tid
          )
      );
      PushController::publishData($broadcast_data);
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
      $broadcast_data = array(
          'category' => 'scrum.realtime_' . Session::get('current_project') . '.team',
          'type' => 'remove_member',
          'time' => date('H:i:s'),
          'content' => array(
              'select_uid' => $input['select_uid'],
              'start_tid' => $input['tid']
          )
      );
      PushController::publishData($broadcast_data);
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

      $broadcast_data = array(
          'category' => 'scrum.realtime_' . Session::get('current_project') . '.team',
          'type' => 'update',
          'time' => date('H:i:s'),
          'content' => array(
              'tid' => $input['tid']
          )
      );
      PushController::publishData($broadcast_data);
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
    $html .= '<div class="box box-color box-small box-bordered"><div class="box-title"><h3><i class="glyphicon-group"></i>';
    $html .= '<a href="' . $team->tid . '" class="team-name">' . $team->name . '</a>';
    $html .= '</h3><div class="actions"></div></div><div class="box-content"><div class="team-members">';
    $html .= '<div data-name="' . $team->master_name . '" data-value="' . $team->master_id . '" class="leader ui-draggable">';
    $html .= '<img src="data/image/user/' . $team->master_image . '" alt="">';
    $html .= '<p class="person-name">' . $team->master_name . '</p></div>';
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
      $broadcast_data = array(
          'category' => 'scrum.realtime_' . Session::get('current_project') . '.team',
          'type' => 'add_member',
          'time' => date('H:i:s'),
          'content' => array(
              'select_uid' => $input['select_uid'],
              'end_tid' => $input['end_tid']
          )
      );
      PushController::publishData($broadcast_data);
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
      $broadcast_data = array(
          'category' => 'scrum.realtime_' . Session::get('current_project') . '.team',
          'type' => 'move_member',
          'time' => date('H:i:s'),
          'content' => array(
              'start_tid' => $input['start_tid'],
              'select_uid' => $input['select_uid'],
              'end_tid' => $input['end_tid']
          )
      );
      PushController::publishData($broadcast_data);
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
    $free_user = $user->getNotInProject2();
    $html = '';
    foreach ($free_user as $user) {
      $html .= '<div id="member_' . $user->uid . '" class="person" data-uid="' . $user->uid . '" data-name="' . $user->fullname . '">';
      $html .= '<img alt="" src="data/image/user/' . $user->image . '">';
      $html .= '<p class="person-name">' . $user->fullname . '</p></div>';
    }
    return $html;
  }

}
