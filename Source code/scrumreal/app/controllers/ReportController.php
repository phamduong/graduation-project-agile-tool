<?php

class ReportController extends BaseController {

  public function index($spid = '', $tid = '') {
    if (Session::has('current_project')) {
      $data = array();
      $data['lang'] = parent::getLanguage();
      $data['cur_user'] = parent::getCurrentUser();
      $data['active_nav'] = 'burndown';
      $data['current_proj_name'] = Session::get('current_project_nm');
      $current_project = Session::get('current_project');
      $sprint = new Sprint;
      $team = new Team;
      $data['sprint_list'] = $sprint->getSprintInProject($current_project);
      $data['team_list'] = $team->getTeamOnProject($current_project);
      $data['current_project'] = Session::get('current_project');
      if ($tid === '-1' || $tid === '') {
        //if overview
        if ($spid === '') {
          //first sprint
          if (count($data['sprint_list'])) {
            $data['report_selected_sprint'] = $data['sprint_list'][0]->spid;
          } else {
            $data['report_selected_sprint'] = '';
          }
        } else {
          $data['report_selected_sprint'] = $spid;
        }
        return View::make('burn_down_overview', $data);
      } else {
        if ($spid === '') {
          //first sprint
          if (count($data['sprint_list'])) {
            $data['report_selected_sprint'] = $data['sprint_list'][0]->spid;
          } else {
            $data['report_selected_sprint'] = '';
          }
        } else {
          //selected sprint
          $data['report_selected_sprint'] = $spid;
        }
        //team information
        $data['report_selected_team'] = $tid;
        if ($tid != 0) {
          $data['report_selected_team_name'] = Team::find($tid)->name;
        } else {
          $data['report_selected_team_name'] = "All team";
        }
        return View::make('burn_down_detail', $data);
      }
    } else {
      return Redirect::to('/project');
    }
  }

  public function sprintAllTeamBurnDown() {
    $input = Input::all();
    $data = array();
    if (isset($input['spid'])) {
      $spid = $input['spid'];
      $sprint = Sprint::find($spid);

      $sprint_start_str = strtotime($sprint->start_date_es);
      $sprint_end_str = strtotime($sprint->end_date_es);
      //xaxis
      $data['xaxis']['sprint_start_date'] = $sprint_start_str;
      $data['xaxis']['sprint_end_date'] = $sprint_end_str;
      //yaxis
      $task_model = new Task;
      $total_day_in_sprint = $task_model->getTotalDaysInSprintAll($spid);
      $data['yaxis'][] = array('time' => $sprint_start_str, 'days' => $total_day_in_sprint);
      $current_date = strtotime(date('Y-m-d H:i:s'));
      for ($i = $sprint_start_str + (2 * 86400); $i <= $sprint_end_str; $i += (2 * 86400)) {
        if ($i <= $current_date) {
          $temp = date('Y-m-d H:i:s', $i);
          $data['yaxis'][] = array('time' => $i, 'days' => $total_day_in_sprint - ($task_model->getTotalDaysInSprintDoneAll($spid, $temp)));
        }
      }
    }
    return $data;
  }

  public function sprintOneTeamBurnDown() {
    $input = Input::all();
    $spid = $input['spid'];
    $tid = $input['tid'];

    $sprint = Sprint::find($spid);
    $data = array();
    $sprint_start_str = strtotime($sprint->start_date_es);
    $sprint_end_str = strtotime($sprint->end_date_es);
    //xaxis
    $data['xaxis']['sprint_start_date'] = $sprint_start_str;
    $data['xaxis']['sprint_end_date'] = $sprint_end_str;
    //yaxis
    $task_model = new Task;
    $total_day_in_sprint = $task_model->getTotalDaysInSprintTeam($spid, $tid);
    $data['yaxis'][] = array('time' => $sprint_start_str, 'days' => $total_day_in_sprint);
    $current_date = strtotime(date('Y-m-d H:i:s'));
    for ($i = $sprint_start_str + (2 * 86400); $i <= $sprint_end_str; $i += (2 * 86400)) {
      if ($i <= $current_date) {
        $temp = date('Y-m-d H:i:s', $i);
        $data['yaxis'][] = array('time' => $i, 'days' => $total_day_in_sprint - ($task_model->getTotalDaysInSprintDoneTeam($spid, $tid, $temp)));
      }
    }
    return $data;
  }

  public function sprintBurnUp() {
    if (Session::has('current_project')) {
      $data = array();
      $data['lang'] = parent::getLanguage();
      $data['cur_user'] = parent::getCurrentUser();
      $data['active_nav'] = 'burnup';
      $data['current_proj_name'] = Session::get('current_project_nm');
      return View::make('burn_up', $data);
    } else {
      return Redirect::to('/project');
    }
  }

  public function sprintBurnUpGetData() {
    $pid = Session::get('current_project');
    $project = Project::find($pid);
    $data = array();
    $project_start_str = strtotime($project->start_date);
    $project_end_str = strtotime($project->end_date_es);
    //xaxis
    $data['xaxis']['project_start_date'] = $project_start_str;
    $data['xaxis']['project_end_date'] = $project_end_str;
    //yaxis
    $story_model = new Story;
    $total_point = $story_model->getTotalStoryPoint($pid);
    $data['yaxis'][] = array('time' => $project_start_str, 'points' => 0);
    $current_date = strtotime(date('Y-m-d H:i:s'));
    for ($i = $project_start_str + (2 * 86400); $i <= $project_end_str; $i += (2 * 86400)) {
      if ($i <= $current_date) {
        $temp = date('Y-m-d H:i:s', $i);
        $data['yaxis'][] = array('time' => $i, 'points' => $story_model->getStoryPointDoneInTime($pid, $temp));
      }
    }
    //get total line
    for ($i = $project_start_str; $i <= $project_end_str; $i += (2 * 86400)) {
      $temp = date('Y-m-d H:i:s', $i);
      $data['yaxis_total'][] = array('time' => $i, 'points' => $story_model->getTotalStoryPointAtTime($pid, $temp));
    }
    return $data;
  }

}
