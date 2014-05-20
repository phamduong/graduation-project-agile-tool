<?php

class TeamController extends BaseController {

  public function index() {
    $data = array();
    $user = new User;
    $team = new Team;
    //Common data
    $data['lang'] = parent::getLanguage();
    $data['cur_user'] = parent::getCurrentUser();
    $data['active_nav'] = 'people';
    $data['role'] = parent::getRole();
    $data['free_user'] = $user->getNotInProject();
    $data['team_list'] = $team->getTeamList(Session::get('current_project'));
    return View::make('people', $data);
  }

  public function addTeam() {
    $input = Input::all();
    $team = new Team;
    $project = new Project;
    $team->name = $input['name'];
    $pid = Session::get('current_project');
    $team->pid = $pid;
    $team->master = $input['master'];
    $team->description = $input['description'];
    if ($team->save() == 1) {
      //Insert user to project_user table
      if ($project->addUser($pid, $input['master'], ROLE_SCRUM_MASTER)) {
        $data = array('status' => 200, 'message' => 'Add team successfully!');
      }
    } else {
      $data = array('status' => 800, 'message' => 'Error!');
    }
    return $data;
  }

}
