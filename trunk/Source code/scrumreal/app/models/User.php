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
  public function getNotInProject($name) {
    $query = <<<SQL
SELECT user.uid, user.fullname, user.image
FROM user
WHERE user.uid NOT IN
 (
		SELECT user.uid
		FROM user INNER JOIN project_user ON user.uid = project_user.uid 
							INNER JOIN project ON project_user.pid = project.pid
		WHERE project.status <> 0 AND project.status <> 2 OR project.status <> 3
	)
  AND user.delete_flg = 0
  AND user.fullname LIKE '%$name%'
SQL;
    $result = DB::select($query);
    return $result;
  }

  /**
   * Get user  IN cancel, complete, pause project
   * @return type
   */
  public function getNotInProject2() {
    $query = <<<SQL
SELECT user.uid, user.fullname, user.image
FROM user
WHERE user.uid NOT IN
 (
		SELECT user.uid
		FROM user INNER JOIN project_user ON user.uid = project_user.uid 
							INNER JOIN project ON project_user.pid = project.pid
		WHERE project.status <> 0 AND project.status <> 2 OR project.status <> 3
	)
  AND user.delete_flg = 0
SQL;
    $result = DB::select($query);
    return $result;
  }

  /**
   * Get people who could be project leader
   * Any free user and project leader in active or initial project
   * @return type
   */
  public function getCandicate($name) {
    $query = <<<SQL
SELECT user.uid, user.fullname
FROM user
WHERE (user.uid NOT IN
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
	))
  AND user.delete_flg = 0
  AND user.fullname LIKE '%$name%'
SQL;
    $result = DB::select($query);
    return $result;
  }

  public function getUserInProject($pid) {
    $query = <<<SQL
SELECT `user`.uid, user.fullname
FROM project_user INNER JOIN user on project_user.uid = user.uid
WHERE project_user.pid = ? AND user.delete_flg = 0
SQL;
    $result = DB::select($query, array($pid));
    return $result;
  }

  public function getUserDataTables() {
    $query = <<<SQL
SELECT `user`.uid, `user`.image, `user`.fullname AS user_name, `user`.birthday, prj.`name` AS project_name, COUNT(project_user.pid) AS count_project
FROM `user` LEFT JOIN project_user ON `user`.uid = project_user.uid
		LEFT JOIN ( SELECT project.* FROM project WHERE project.`status` = 1 ) AS prj ON project_user.pid = prj.pid
WHERE user.delete_flg = 0
GROUP BY `user`.uid
SQL;
    $result = DB::select($query);
    return $result;
  }

  public function getAttendProject($uid) {
    $query = <<<SQL
SELECT project.name, project.start_date,
	CASE
	WHEN project.`status` = 2 THEN
		project.end_date_real
	ELSE
		project.end_date_es
	END AS end_date
	,project.`status`	
FROM project INNER JOIN project_user ON project_user.pid = project.pid
WHERE project_user.uid = ? AND project.delete_flg = 0
SQL;
    $result = DB::select($query, array($uid));
    return $result;
  }

  public function getUserRoleInProject($pid, $uid) {
    $query = <<<SQL
SELECT rid
FROM project_user
WHERE pid = ? and uid = ?
SQL;
    $result = DB::select($query, array($pid, $uid));
    if (count($result) != 0) {
      return $result[0]->rid;
    }
    return ROLE_NOT_IN_PROJECT;
  }

}
