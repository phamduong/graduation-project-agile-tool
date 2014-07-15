<?php

class PermissionController extends BaseController {

  public function index() {
    if (Session::has('current_project')) {
      $data = array();
      //$user = new User;
      $role = new Role;
      $permission = new Permission;
      $data['lang'] = parent::getLanguage();
      $data['cur_user'] = parent::getCurrentUser();
      $data['active_nav'] = 'permission';
      $data['current_proj_name'] = Session::get('current_project_nm');
      $data['list_role'] = $role->getAllRole();
      $data['list_permission'] = $permission->getAllPermission();
      foreach ($data['list_permission'] as $p) {
        $p->role_satus = $this->mergeRole($permission->getPermissionForRole($p->peid));
      }
//      print '<pre>';
//      print_r($data['list_permission']);
//      exit();
      return View::make('permission', $data);
    } else {
      return Redirect::to('/project');
    }
  }

  protected function mergeRole($arr) {
    $data = array();
    foreach ($arr as $val) {
      $data[] = $val->rid;
    }
    return $data;
  }

  public function save() {
    $list_input = Input::all();
    $permission = new Permission;
    $list_db = $permission->getPer_Role();
    $list_db_key = array();
    foreach ($list_db as $val) {
      $list_db_key[] = $val->per_role;
    }
    foreach ($list_input as $key => $val) {
      if ($val == 1 && in_array($key, $list_db_key) == false) {
        $data = explode('_', $key);
//        print_r($data);
        $permission->insertPermission($data[1], $data[0]);
      } else if ($val == 0 && in_array($key, $list_db_key) == true) {
        $data = explode('_', $key);
        $permission->deletePermission($data[1], $data[0]);
      }
    }
    $data = array('status' => 200, 'message' => 'Successfull!');
    return $data;
  }

  public static function checkPermission($uid, $path) {
    //List path will not be checked for permission
    $arr_ignore_path = array(
        '/' => 0,
        '/project' => 0,
        '/login' => 0,
        '/logout' => 0,
        '/project\/datatables\?_=\d+/' => 1,
        '/project/set_current' => 0,
        '/project/check_current' => 0,
        '/permission/check' => 0,
        '/attach\/\d+\/\d+/' => 1,
        '/attach/remove_attach' => 0,
        '/download_attach\/\d+/' => 1
    );
    foreach ($arr_ignore_path as $key => $val) {
      if ($path == $key) {
        return true;
      } else if ($val == 1) {
        if (preg_match($key, $path)) {
          return true;
        }
      }
    }
    //test 
    Session::forget('user_permission');

    if (Session::has('user_permission') == false) {
      //If does not load permission -> load it!
      $permission = new Permission;
      $list_per = $permission->getUserPermission($uid, Session::get('current_project'));
      $data = array();
      $i = 0;
      foreach ($list_per as $per) {
        $data[$i]['path'] = $per->path;
        $data[$i]['type'] = $per->type;
        $i++;
      }
      Session::put('user_permission', $data);
    }
    $list = Session::get('user_permission');
//    var_dump($list);
//    exit();
    $check = false;
    foreach ($list as $p) {
      if ($p['type'] == 0) {
        if ($path == $p['path']) {
          $check = true;
          return $check;
        }
      } elseif ($p['type'] == 1) { //check with regex
//        $t = preg_match($p['path'], $path);
//        var_dump($t);
//        exit();
        if (preg_match($p['path'], $path)) {
          $check = true;
          return $check;
        }
      }
    }
    return $check;
  }

  public function checkLinkPermission() {
    $input = Input::all();
    $path = $input['path'];
    $uid = Auth::user()->uid;
    if ($this->checkPermission($uid, $path) == false) {
      $data = array('status' => 801,
          'message' => "You don't have permission to perform this action",
          'url' => $path);      
    }else{
      $data = array('status' => 200);
    }
//    $data = array('status' => 200); // test
    return $data;
  }

}
