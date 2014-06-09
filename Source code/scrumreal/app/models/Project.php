<?php

class Project extends Eloquent {

  protected $table = 'project';
  public $timestamps = false;
  public $primaryKey = 'pid';

  /**
   * Get data for datatables
   * @return array
   */
  public function getAll() {
    $query = <<<SQL
SELECT project.name, project_owner.owner,  project_leader.leader, project.start_date,
IF (project.status = 2, project.end_date_real, project.end_date_es) as end_date, project.status,
  project.pid
FROM project
LEFT JOIN 
	(
		SELECT user.fullname as leader, project.pid as pid
		FROM project JOIN project_user ON project.pid = project_user.pid
									JOIN user ON project_user.uid = user.uid
		WHERE project_user.rid = 1
	)project_leader
ON project_leader.pid = project.pid
LEFT JOIN
	(
		SELECT user.fullname as owner, project.pid as pid
		FROM project JOIN project_user ON project.pid = project_user.pid
									JOIN user ON project_user.uid = user.uid
		WHERE project_user.rid = 4
	)project_owner
ON project_owner.pid = project.pid            
SQL;
    $result = array();
    $result["aaData"] = DB::select($query);
    return $result;
  }

  public function getProject($pid) {
    $query = <<<SQL
SELECT project.pid, project.name, project.start_date, project.end_date_es, project.note, project.description,
IF (project.status = 2, project.end_date_real, project.end_date_es) as end_date, project.status,
project_leader.fullname as leader_name, project_leader.uid as leader_id, project_owner.fullname as owner_name, project_owner.uid as owner_id
FROM project
LEFT JOIN
	(
		SELECT user.uid, user.fullname, project.pid
		FROM user INNER JOIN project_user ON user.uid = project_user.uid
								INNER JOIN project on project_user.pid = project.pid
		WHERE project_user.rid = 1
	) project_leader
ON project_leader.pid = project.pid
LEFT JOIN
	(
		SELECT user.uid, user.fullname, project.pid
		FROM user INNER JOIN project_user ON user.uid = project_user.uid 
								INNER JOIN project on project_user.pid = project.pid
		WHERE project_user.rid = 4
	) project_owner
ON project_owner.pid = project.pid
WHERE project.pid = ?
SQL;
    $result = DB::select($query, array($pid));
    return $result[0];
  }

  public function checkExist($pid, $user_id) {
    $exist = false;
    $query = <<<SQL
SELECT count(*) as count
FROM project_user
WHERE uid = ?
	AND pid = ?
SQL;
    $result = DB::select($query, array($user_id, $pid, $user_role));    
    return $result[0]->count;
  }

  public function insertProjectUser($pid, $user_id, $user_role) {
    $query = <<<SQL
INSERT INTO project_user
  (
    pid,
    uid,
    rid
  )
VALUE
	(
    ?,
    ?,
    ?
  )
SQL;
    $result = DB::insert($query, array($pid, $user_id, $user_role));
    return $result;
  }

  public function updateProjectUser($pid, $user_id, $user_role) {
    $query = <<<SQL
UPDATE project_user
SET uid = ?
WHERE pid = ? AND rid = ?
SQL;
    $result = DB::update($query, array($user_id, $pid, $user_role));
    return $result;
  }

}
