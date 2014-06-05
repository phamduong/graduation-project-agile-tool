<?php

class ReportController extends BaseController {
  public function index(){
    if (Session::has('current_project')) {
      $data = array();
      $user = new User;
      $data['lang'] = parent::getLanguage();
      $data['cur_user'] = parent::getCurrentUser();
      $data['active_nav'] = 'report';
      $data['current_proj_name'] = Session::get('current_project_nm');
      return View::make('report', $data);
    } else {
      return Redirect::to('/project');
    }
  }
}