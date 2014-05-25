<?php

class Team extends Eloquent {

  protected $table = 'team';
  public $timestamps = false;
  public $primaryKey = 'tid';

  /**
   * Get team list and team leader
   * @param type $pid project id
   * @return type
   */
  public function getTeamList($pid) {
    $query = <<<SQL
SELECT team.tid, team.name, user.uid AS master_id, user.fullname AS master_name, user.image AS master_image
FROM team INNER JOIN project_user ON team.tid = project_user.tid
	INNER JOIN user on user.uid = project_user.uid
WHERE project_user.pid = ? AND project_user.rid = ?
SQL;
    $result = DB::select($query, array($pid, ROLE_SCRUM_MASTER));
    return $result;
  }

  /**
   * Team members can not be (leader, owner, scrum master)
   * @param type $tid
   * @param type $pid
   * @return type
   */
  public function getTeamMembers($tid, $pid) {
    $query = <<<SQL
SELECT `user`.uid, `user`.image, `user`.fullname
FROM `user` INNER JOIN project_user ON user.uid = project_user.uid
WHERE project_user.tid = ? AND project_user.pid = ? AND project_user.rid = ?
GROUP BY uid
SQL;
    $result = DB::select($query, array($tid, $pid, ROLE_MEMBER));
    return $result;
  }

  /**
   * Get team detail
   * @param type $pid
   * @param type $tid
   * @return type
   */
  public function getTeam($pid, $tid) {
    $query = <<<SQL
SELECT team.tid, team.name, team.description ,user.uid AS master_id, user.fullname AS master_name
FROM team INNER JOIN project_user ON team.tid = project_user.tid
	INNER JOIN user on user.uid = project_user.uid
WHERE project_user.pid = ? AND project_user.rid = ? AND team.tid = ?
SQL;
    $result = DB::select($query, array($pid, ROLE_SCRUM_MASTER, $tid));
    return $result[0];
  }

  public function getTeamOnProject($pid) {
    $query = <<<SQL
SELECT *
FROM team
WHERE team.pid = ?
SQL;
    $result = DB::select($query, array($pid));
    return $result;
  }

  /**
   * Add user to project
   * @param type $pid project id
   * @param type $uid user id
   * @param type $rid role id in project
   */
  public function addToProject($pid, $uid, $tid, $rid) {
    $query = <<<SQL
INSERT INTO project_user VALUES(?, ?, ?, ?)
SQL;
    $row_count = DB::insert($query, array($pid, $uid, $tid, $rid));
    return $row_count;
  }

  /**
   * Model delete user from project
   * @param type $pid project id
   * @param type $uid user id
   * @param type $tid team id
   * @return type
   */
  public function removeFromProject($pid, $uid) {
    $query = <<<SQL
DELETE FROM project_user
WHERE pid = ? AND uid = ?
SQL;
    $result = DB::delete($query, array($pid, $uid));
    return $result;
  }

  public function moveToTeam($pid, $uid, $end_tid) {
    $query = <<<SQL
UPDATE project_user 
SET project_user.tid = ?
WHERE project_user.pid = ?
	AND project_user.uid = ?
SQL;
    $result = DB::update($query, array($end_tid, $pid, $uid));
    return $result;
  }

}
