<?php

use Illuminate\Auth\UserInterface;
use Illuminate\Auth\Reminders\RemindableInterface;

class User extends Eloquent implements UserInterface, RemindableInterface {

  /**
   * The database table used by the model.
   *
   * @var string
   */
  protected $table = 'user';
  public $timestamps = false;
  public $primaryKey = 'uid';

  /**
   * The attributes excluded from the model's JSON form.
   *
   * @var array
   */
//  protected $hidden = array('password');
  public static $rules = array(
      'uname' => 'required',
      'upw' => 'required'
  );

  /**
   * Get the unique identifier for the user.
   *
   * @return mixed
   */
  public function getAuthIdentifier() {
    return $this->getKey();
  }

  /**
   * Get the password for the user.
   *
   * @return string
   */
  public function getAuthPassword() {
    return $this->password;
  }

  /**
   * Get the token value for the "remember me" session.
   *
   * @return string
   */
  public function getRememberToken() {
    return $this->remember_token;
  }

  /**
   * Set the token value for the "remember me" session.
   *
   * @param  string  $value
   * @return void
   */
  public function setRememberToken($value) {
    $this->remember_token = $value;
  }

  /**
   * Get the column name for the "remember me" token.
   *
   * @return string
   */
  public function getRememberTokenName() {
    return 'remember_token';
  }

  /**
   * Get the e-mail address where password reminders are sent.
   *
   * @return string
   */
  public function getReminderEmail() {
    return $this->email;
  }
  
  /**
   * Get user who are not in any project or project which are not started
   * @return type
   */
  public function getNotInProject(){
    $query = <<<SQL
SELECT user.uid, user.fullname, user.image
FROM user
WHERE user.uid NOT IN
 (
		SELECT user.uid
		FROM user INNER JOIN project_user ON user.uid = project_user.uid 
							INNER JOIN project ON project_user.pid = project.pid
		WHERE project.status = 1
	)            
SQL;
    $result = DB::select($query);
    return $result;
  }

  /**
   * Get people who could be project leader
   * Any free user and project leader in active or initial project
   * @return type
   */
  public function getCandicate(){
    $query = <<<SQL
SELECT user.uid, user.fullname
FROM user
WHERE user.uid NOT IN
 (
		SELECT user.uid
		FROM user INNER JOIN project_user ON user.uid = project_user.uid 
							INNER JOIN project ON project_user.pid = project.pid
		WHERE project.status = 1
	)
	OR user.uid IN
	(
		SELECT user.uid
		FROM user INNER JOIN project_user ON user.uid = project_user.uid 
							INNER JOIN project ON project_user.pid = project.pid
		WHERE project.status = 1 AND project_user.rid = 1
	)
SQL;
    $result = DB::select($query);
    return $result;
  }
}
