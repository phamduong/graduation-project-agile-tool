<?php

class ProjectController extends BaseController {

  /**
   * Project page
   * @return type
   */
  public function index() {
    if (!Auth::check()) {
      return Redirect::to('/');
    } else {
      $data = array();
      $user = new User;
      //Common data
      $data['lang'] = parent::getLanguage();
      $data['cur_user'] = parent::getCurrentUser();
      $data['active_nav'] = 'project';

      //Project page data
      $data['role'] = parent::getRole();
      //$data['free_user'] = $user->getNotInProject();
      //$data['candicate_leader'] = $user->getCandicate();
      $data['current_project'] = Session::get('current_project');
      return View::make('project', $data);
    }
  }

  public function getLeader() {
    $data = array();
    $input = Input::all();
    $user = new User;
    $result = $user->getCandicate($input['q']);
    if (count($result) > 0) {
      foreach ($result as $val) {
        $data[] = array("id" => $val->uid, "text" => $val->fullname);
      }
    } else {
      $data = array("id" => 0, "text" => "No result found...");
    }
    return json_encode($data);
  }

  public function getOwner() {
    $data = array();
    $input = Input::all();
    $user = new User;
    $result = $user->getNotInProject($input['q']);
    if (count($result) > 0) {
      foreach ($result as $val) {
        $data[] = array("id" => $val->uid, "text" => $val->fullname);
      }
    } else {
      $data = array("id" => 0, "text" => "No result found...");
    }
    return json_encode($data);
  }

  public function save() {
    $input = Input::all();
    $project = Project::find($input['pid']);
    $arr_match = array(
        'name' => 'Name',
        'status' => 'Status',
        'start_date' => 'Start date',
        'end_date_es' => 'Estimate end date',
        'description' => 'Desciption',
        'note' => 'Note'
    );
    //change date to same format
    $project->start_date = date('Y-m-d', strtotime($project->start_date));
    $project->end_date_es = date('Y-m-d', strtotime($project->end_date_es));

    $date_arr = explode(' - ', $input['project_date_range']);
    $input['start_date'] = date('Y-m-d', strtotime($date_arr[0]));
    $input['end_date_es'] = date('Y-m-d', strtotime($date_arr[1]));

    //Activity
    foreach ($arr_match as $key => $value) {
      if ($project->$key != $input[$key]) {
        ActivityController::createActivityUpdate($input['pid'], ENTITY_PROJECT, $value, $project->$key, $input[$key]);
        $project->$key = $input[$key];
      }
    }

//    $project->name = $input['name'];
//    $project->description = $input['description'];
//    $project->note = $input['note'];
    $project_model = new Project;
    if ($input['leader'] != '') {
      if ($project_model->checkRoleAssign($input['pid'], ROLE_LEADER) == 0) {
        $project_model->insertProjectUser($input['pid'], $input['leader'], ROLE_LEADER);
      } else {
        //remove leader from project user
        $project_model->removeUserWithRole($input['pid'], ROLE_LEADER);
        //insert new leaer to project user
        $project_model->insertProjectUser($input['pid'], $input['leader'], ROLE_LEADER);
      }
    }
    if ($input['owner'] != '') {
      if ($project_model->checkRoleAssign($input['pid'], ROLE_OWNER) == 0) {
        $project_model->insertProjectUser($input['pid'], $input['owner'], ROLE_OWNER);
      } else {
        $project_model->removeUserWithRole($input['pid'], ROLE_OWNER);
        $project_model->insertProjectUser($input['pid'], $input['owner'], ROLE_OWNER);
      }
    }

    $data = array('status' => 800, 'message' => 'Save unsucessfully');
    if ($project->save()) {
      $data = array('status' => 200, 'message' => 'Save sucessfully');
    }
    return $data;
  }

  public function complete() {
    $input = Input::all();
    $pid = $input['pid'];
    //Check if project contain any unfinished sprint, task, story
    $sprint = new Sprint;
    $story = new Story;
    $task = new Task;
    if (count($sprint->getSprintNotComplete($pid)) > 0) {
      $data = array('status' => 803, 'message' => 'Project contains uncompleted sprints');
    } else if (count($story->getStoryNotComplete($pid)) > 0) {
      $data = array('status' => 804, 'message' => 'Project contains uncompleted storys');
    } else if (count($task->getTaskNotComplete($pid)) > 0) {
      $data = array('status' => 805, 'message' => 'Project contains uncompleted tasks');
    } else {
      $project = Project::find($pid);
      ActivityController::createActivityUpdate($pid, ENTITY_PROJECT, 'Status', $project->$status, PROJECT_COMPLETE_STATUS);
      $project->status = PROJECT_COMPLETE_STATUS;
      if ($project->save()) {
        $data = array('status' => 800, 'message' => 'Project successfully complete.');
      }
    }
    return $data;
  }

  /**
   * Get datatables for project page
   * @return string
   */
  public function getDatatables() {
    $project = new Project;
    $p_list = $project->getAll();
    return json_encode($p_list);
  }

  /**
   * Add new project
   * @return string|int
   */
  public function add() {
    $input = Input::all();
    $project = new Project;
    $project->name = $input['name'];
    $date_arr = explode(' - ', $input['project_date_range']);
    $project->start_date = date('Y-m-d', strtotime($date_arr[0]));
    $project->end_date_es = date('Y-m-d', strtotime($date_arr[1]));
    $project->note = $input['note'];
    $project->status = PROJECT_NEW_STATUS; //active
    $project->description = $input['description'];
    if ($project->save() == 1) {
      $pid = $project->pid;
      $project_model = new Project;
      if ($input['leader'] != '') {
        $project_model->insertProjectUser($pid, $input['leader'], ROLE_LEADER);
      }
      if ($input['owner'] != '') {
        $project_model->insertProjectUser($pid, $input['owner'], ROLE_OWNER);
      }
      ActivityController::createActivityCreate($pid, ENTITY_PROJECT);
      $data = array(
          'status' => 200,
          'message' => 'Create project successfully!',
          'pid' => $project->pid
      );
      return $data;
    }
    $data = array(
        'status' => 800,
        'message' => 'Error!'
    );

    $broadcast_data = array(
        'category' => 'scrum.realtime.project',
        'type' => 'add',
        'time' => date('H:i:s'),
        'content' => array(
            'pid' => $pid,
            'name' => $project->name
        )
    );
    PushController::publishData($broadcast_data);
    
    return $data;
  }

  public function delete() {
    $input = Input::all();
    $project = Project::find($input['pid']);
    $project->delete_flg = 1;
    $project_model = new Project;
    $project_model->deleteProjectUser($input['pid']);
    if ($project->save()) {
      $data = array(
          'status' => 200,
          'message' => 'Delete project successfully!'
      );
    } else {
      $data = array(
          'status' => 800,
          'message' => 'Error!'
      );
    }
    return $data;
  }

  /**
   * Load project info, settings, comment and activity.
   * @return string
   */
  public function edit() {
    $data = array('status' => 800, 'message' => 'Error!');
    $input = Input::all();
    if (isset($input['pid'])) {
      $pid = $input['pid'];
      $project = new Project;
      $comment = new Comment;
      $data['project_info'] = $project->getProject($pid);
      //Get comment
      $data['comment'] = $comment->getComment($pid, ENTITY_PROJECT);
      $data['attachment'] = AttachController::getAttach(ENTITY_PROJECT, $pid);
      $data['status'] = 200;
      $data['message'] = '';
    }
    return $data;
  }

  /**
   * Set current user working project
   * @return int
   */
  public function setCurrentProject() {
    $input = Input::all();
    Session::put('current_project', $input['pid']);
    $proj_nm = Project::find($input['pid'])->name;
    Session::put('current_project_nm', $proj_nm);
    $data = array('status' => 200, 'message' => 'Set current project successfully');
    return $data;
  }

  /**
   * Check whether or not user selects an working project
   * @return string
   */
  public function checkCurrentProject() {
    $data = array();
    if (Session::has('current_project')) {
      $data['status'] = 200;
    } else {
      $data['status'] = 801;
      $data['message'] = 'Please select your working project';
    }
    return $data;
  }

}
