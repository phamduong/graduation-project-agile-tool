<?php

class UserController extends \BaseController {

  /**
   * Display a listing of the resource.
   *
   * @return Response
   */
  public function index() {
    //
  }

  /**
   * Show the form for creating a new resource.
   *
   * @return Response
   */
  public function create() {
    //
  }

  /**
   * Store a newly created resource in storage.
   *
   * @return Response
   */
  public function store() {
    //
  }

  /**
   * Display the specified resource.
   *
   * @param  int  $id
   * @return Response
   */
  public function show($id) {
    //
  }

  /**
   * Show the form for editing the specified resource.
   *
   * @param  int  $id
   * @return Response
   */
  public function edit($id) {
    //
  }

  /**
   * Update the specified resource in storage.
   *
   * @param  int  $id
   * @return Response
   */
  public function update($id) {
    //
  }

  /**
   * Remove the specified resource from storage.
   *
   * @param  int  $id
   * @return Response
   */
  public function destroy($id) {
    //
  }

  public function login() {
    if (Input::server("REQUEST_METHOD") == "POST") {  //If login action
      $input = Input::all();
      $data = array();
      $validator = Validator::make($input, User::$rules);
      if ($validator->passes()) {
        $credentials = array(
            "login_nm" => Input::get("uname"),
            "password" => Input::get("upw")
        );
        if (Auth::attempt($credentials)) {
          $data['status'] = 200;
        } else {
          $data['status'] = 800;
          $data['message'] = Lang::get('message.login_err');
        }
        return $data;
      } else {
        $data['status'] = 800;
        $data['message'] = Lang::get('message.login_err');
        return $data;
      }
    } else {  //If access login page
      return View::make('user.login');
    }
  }

  public function logout() {
    Auth::logout();
    return Redirect::to('/');
  }

  public function profile() {
    if (Request::segment(1) == 'user-profile') {
      $data = array(
          'profile' => 'active',
          'user_settings' => ''
      );
    } else {
      $data = array(
          'profile' => '',
          'user_settings' => 'active'
      );
    }
    return View::make('user.profile', $data);
  }

}
