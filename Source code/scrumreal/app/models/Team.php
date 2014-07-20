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
WHERE project_user.pid = ? AND project_user.rid = ? AND team.delete_flg = 0 AND user.delete_flg = 0
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
WHERE project_user.tid = ? AND project_user.pid = ? AND project_user.rid = ? AND user.delete_flg = 0
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
SELECT team.tid, team.name, team.description ,user.uid AS master_id, user.fullname AS master_name,
            user.image AS master_image
FROM team INNER JOIN project_user ON team.tid = project_user.tid
	INNER JOIN user on user.uid = project_user.uid
WHERE project_user.pid = ? AND project_user.rid = ? AND team.tid = ? AND team.delete_flg = 0
SQL;
    $result = DB::select($query, array($pid, ROLE_SCRUM_MASTER, $tid));
    return $result[0];
  }

  public function getTeamOnProject($pid) {
    $query = <<<SQL
SELECT *
FROM team
WHERE team.pid = ? AND delete_flg = 0
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

  public function removeTeamMemFromProject($tid) {
    $query = <<<SQL
DELETE FROM project_user
WHERE tid = ?
SQL;
    $result = DB::delete($query, array($tid));
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

  public function updateMaster($pid, $tid, $uid) {
    $query_1 = <<<SQL
DELETE FROM
	project_user
WHERE
	pid = ?
AND tid = ?
AND rid = ?
SQL;
    DB::delete($query_1, array($pid, $tid, ROLE_SCRUM_MASTER));
    $query_2 = <<<SQL
INSERT INTO
	project_user
	(
		pid,
		uid,
		tid,
		rid
	)
VALUES
	(
		?,
		?,
		?,
		?
	)
SQL;
    DB::insert($query_2, array($pid, $uid, $tid, ROLE_SCRUM_MASTER));
  }

  public function addToSprint_Team($spid, $tid) {
    $query = <<<SQL
  INSERT INTO sprint_team 
    (spid, tid, num_day)
  VALUES
    (?, ?, ?)
SQL;
    $result = DB::insert($query, array($spid, $tid, 0));
    return $result;
  }

  public function deleteFromSprint_Team($spid, $tid) {
    $query = <<<SQL
  DELETE FROM sprint_team
  WHERE spid = ? and tid = ?
SQL;
    $result = DB::delete($query, array($spid, $tid));
    return $result;
  }

  public function deleteFromStory_Team($sid, $tid) {
    $query = <<<SQL
  DELETE FROM story_team
  WHERE sid = ? AND tid = ?
SQL;
    $result = DB::delete($query, array($sid, $tid));
    return $result;
  }

  public function removeTeamLeaderFromProject($pid, $tid) {
    $query = <<<SQL
  DELETE FROM project_user
  WHERE pid = ? AND tid = ? AND rid = ?
SQL;
    $result = DB::delete($query, array($pid, $tid, ROLE_SCRUM_MASTER));
    return $result;
  }

}
