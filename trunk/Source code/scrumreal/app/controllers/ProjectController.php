<?php

class ProjectController extends BaseController {

  /**
   * Project page
   * @return type
   */
  public function index() {
    $data = array();
    $user = new User;
    //Common data
    $data['lang'] = parent::getLanguage();
    $data['cur_user'] = parent::getCurrentUser();
    $data['active_nav'] = 'project';

    //Project page data
    $data['role'] = parent::getRole();
    $data['free_user'] = $user->getNotInProject();
    $data['candicate_leader'] = $user->getCandicate();
    if (Session::has('current_project')) {
      $data['current_project'] = Session::get('current_project');
    }
//    print '<pre>';
//    print_r($data);
//    exit();
    return View::make('project', $data);
  }

  public function save() {
    $input = Input::all();
    $project = Project::find($input['pid']);
    $project->name = $input['name'];
    $date_arr = explode(' - ', $input['project_date_range']);
    $project->start_date = date('Y-m-d', strtotime($date_arr[0]));
    $project->end_date_es = date('Y-m-d', strtotime($date_arr[1]));
    $project_model = new Project;
    if ($input['leader'] != '') {
      if ($project_model->checkExist($input['pid'], $input['leader']) == 1) {
        $project_model->updateProjectUser($input['pid'], $input['leader'], ROLE_LEADER);
      }else{
        $project_model->insertProjectUser($input['pid'], $input['leader'], ROLE_LEADER);
      }
    }
    if ($input['owner'] != '') {
      if ($project_model->checkExist($input['pid'], $input['owner']) == 1) {
        $project_model->updateProjectUser($input['pid'], $input['owner'], ROLE_OWNER);
      }else{
        $project_model->insertProjectUser($input['pid'], $input['owner'], ROLE_OWNER);
      }
    }
    $project->description = $input['description'];
    $project->note = $input['note'];
    $data = array('status' => 800, 'message' => 'Save unsucessfully');
    if ($project->save()) {
      $data = array('status' => 200, 'message' => 'Save sucessfully');
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
    $project->status = 1; //active
    $project->description = $input['description'];
    if ($project->save() == 1) {
      $pid = $project->pid;
      if ($project->addToProject($pid, $input['leader'], 0, ROLE_LEADER) && $project->addToProject($pid, $input['owner'], 0, ROLE_OWNER)) {
        $data = array(
            'status' => 200,
            'message' => 'Create project successfully!'
        );
        return $data;
      }
    }
    $data = array(
        'status' => 800,
        'message' => 'Error!'
    );
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
