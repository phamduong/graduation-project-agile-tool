<?php

class ProjectController extends BaseController {

  /**
   * Project page
   * @return type
   */
  public function index() {
    $data = array();
    $user = new User;
    $data['lang'] = parent::getLanguage();
    $data['cur_user'] = parent::getCurrentUser();
    $data['role'] = parent::getRole();
    $data['active_nav'] = 'project';
    $data['free_user'] = $user->getNotInProject();
    $data['candicate_leader'] = $user->getCandicate();
//    print_r($data);
//    exit();
    return View::make('project', $data);
  }

  /**
   * Get datatables for project page
   * @return string
   */
  public function getDatatables() {
    $project = new Project;
    $p_list = $project->getAll();
    return json_encode($p_list);
    exit;
    $output = '{"aaData": [';
    foreach ($p_list as $row) {
      $output .= "[";
      $output .= '"' . $row->name . '",';
      $output .= '"' . $row->owner . '",';
      $output .= '"' . $row->leader . '",';
      $output .= '"' . $row->start_date . '",';
      $output .= '"' . $row->end_date . '",';
      $output .= '"' . $row->status . '",';
      $output .= '"' . $row->pid . '"';
      $output .= "],";
    }
    $output = substr_replace($output, "", -1);
    $output .= "]}";
    return $output;
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
      if ($project->addUser($pid, 1, 1) && $project->addUser($pid, 8, 4)) {
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

  public function edit() {
    $data = array();
    $input = Input::all();
    if (isset($input['pid'])) {
      $pid = $input['pid'];
      $project = new Project;
      $comment = new Comment;
      $data['project_info'] = $project->getProject($pid);
      //Get comment
      $count_com = $comment->countComment($pid, ENTITY_PROJECT);
      if ($count_com > COMMENT_COUNT) {
        $data['comment'] = $comment->getComment($pid, ENTITY_PROJECT, 0, COMMENT_COUNT);
        $data['comment']['count_from'] = COMMENT_COUNT;
        $data['comment']['count'] = COMMENT_COUNT;
      } else {
        $data['comment'] = $comment->getComment($pid, ENTITY_PROJECT, 0, $count_com);
      }
      $data['status'] = 200;
      $data['message'] = '';
//      print_r($data['comment']);
    }
//    return json_encode($data);
    return $data;
  }

}
