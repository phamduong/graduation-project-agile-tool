<?php

class Task extends Eloquent {

  protected $table = 'task';
  public $timestamps = false;
  public $primaryKey = 'taid';

  /**
   * Get tasks list for datatables
   * @param type $sid
   * @return type
   */
  public function getTaskList($sid) {
    $query = <<<SQL
SELECT task.*, user.fullname as assign
FROM task LEFT OUTER JOIN user ON task.uid = user.uid 
	INNER JOIN story ON task.sid = story.sid
WHERE story.sid = ?  AND story.delete_flg = 0 AND task.delete_flg = 0
ORDER BY task.create_date DESC
SQL;
    $result = array();
    $result["aaData"] = DB::select($query, array($sid));
    return $result;
  }

  public function getStoryTask($spid) {
    $query = <<<SQL
SELECT story.sid, story.point, story.`name` AS story_name, team.name AS team_name, story.time_estimate, story.status AS story_status
FROM story INNER JOIN story_team ON story.sid = story_team.sid 
		INNER JOIN team ON story_team.tid = team.tid
WHERE story_team.spid = ? AND story.delete_flg = 0
SQL;
    $result = DB::select($query, array($spid));
    return $result;
  }

  public function getStoryTaskByTeam($spid, $tid) {
    $query = <<<SQL
SELECT story.sid, story.point, story.`name` AS story_name, team.name AS team_name, story.time_estimate, story.status AS story_status
FROM story INNER JOIN story_team ON story.sid = story_team.sid 
		INNER JOIN team ON story_team.tid = team.tid
WHERE story_team.spid = ? AND story_team.tid = ?  AND story.delete_flg = 0
SQL;
    $result = DB::select($query, array($spid, $tid));
    return $result;
  }

  public function getTaskInStory($sid) {
    $query = <<<SQL
SELECT task.taid, task.`name`, task.time_estimate, task.`status`, `user`.uid, `user`.image AS user_image, `user`.fullname AS user_name, task.time_remain
FROM task LEFT JOIN `user` ON task.uid = `user`.uid
WHERE task.sid = ? AND task.delete_flg = 0
SQL;
    $result = DB::select($query, array($sid));
    return $result;
  }

  public function getTaskInStoryByUser($sid, $uid) {
    $query = <<<SQL
SELECT task.taid, task.`name`, task.time_estimate, task.`status`, `user`.uid, `user`.image AS user_image, `user`.fullname AS user_name, task.time_remain
FROM task LEFT JOIN `user` ON task.uid = `user`.uid
WHERE task.sid = ? AND task.uid = ? AND task.delete_flg = 0
SQL;
    $result = DB::select($query, array($sid, $uid));
    return $result;
  }

  public function getTaskDetail($taid) {
    $query = <<<SQL
SELECT task.*, user.uid as user_uid, `user`.fullname as user_name, user.image as user_image
FROM task LEFT OUTER JOIN user ON task.uid = user.uid
WHERE task.taid = ? AND task.delete_flg = 0
SQL;
    $result = DB::select($query, array($taid));
    return $result[0];
  }

  /**
   * Get people in team that assigned this story
   * @param type $sid
   * @return type
   */
  public function getPeopleCanAssign($sid) {
    $query = <<<SQL
SELECT user.uid, user.fullname
FROM story INNER JOIN story_team ON story.sid = story_team.sid
	INNER JOIN project_user ON story_team.tid = project_user.tid
	INNER JOIN user ON project_user.uid = user.uid
WHERE story.sid = ? AND story.delete_flg = 0
SQL;
    $result = DB::select($query, array($sid));
    return $result;
  }

  public function getTaskNotComplete($pid) {
    $query = <<<SQL
SELECT task.*
FROM task INNER JOIN story_team ON task.sid = story_team.sid
INNER JOIN sprint ON story_team.spid = sprint.spid
WHERE sprint.pid = ?
	AND task.status <> ?
	AND task.delete_flg = 0
SQL;
    $result = DB::select($query, array($pid, TASK_STATUS_DONE));
    return $result;
  }

  public function updateTaskFinishDate($tid) {
    $query = <<<SQL
  UPDATE task
  SET finish_date = NOW()
SQL;
    $result = DB::update($query);
    return $result;
  }

  /**
   * For all team
   * @param type $spid
   * @return type
   */
  public function getTotalDaysInSprintAll($spid) {
    $query = <<<SQL
SELECT SUM(task.time_estimate) AS total_day
FROM task INNER JOIN story_team ON task.sid = story_team.sid
WHERE story_team.spid = ?
  AND task.delete_flg = 0
SQL;
    $result = DB::select($query, array($spid));
    return $result[0]->total_day;
  }

  public function getTotalDaysInSprintTeam($spid, $tid) {
    $query = <<<SQL
SELECT SUM(task.time_estimate) AS total_day
FROM task INNER JOIN story_team ON task.sid = story_team.sid
WHERE story_team.spid = ? 
  AND story_team.tid = ?
  AND task.delete_flg = 0
SQL;
    $result = DB::select($query, array($spid, $tid));
    return $result[0]->total_day;
  }

  /**
   * For all team
   * @param type $spid
   * @param type $time
   */
  public function getTotalDaysInSprintDoneAll($spid, $time) {
    $query = <<<SQL
SELECT SUM(task.time_estimate) AS total_day
FROM task INNER JOIN story_team ON task.sid = story_team.sid
WHERE task.`status` = 4 
	AND story_team.spid = ?
	AND task.finish_date <= ?
  AND task.delete_flg = 0
SQL;
    $result = DB::select($query, array($spid, $time));
    return $result[0]->total_day;
  }

  public function getTotalDaysInSprintDoneTeam($spid, $tid, $time) {
    $query = <<<SQL
SELECT SUM(task.time_estimate) AS total_day
FROM task INNER JOIN story_team ON task.sid = story_team.sid
WHERE task.`status` = 4 
	AND story_team.spid = ?
	AND story_team.tid = ? 
	AND task.finish_date <= ?
  AND task.delete_flg = 0
SQL;
    $result = DB::select($query, array($spid, $tid, $time));
    return $result[0]->total_day;
  }

    //not use
  public function getTaskInSprint($spid) {
    $query = <<<SQL
SELECT task.*
FROM task INNER JOIN story_team ON task.sid = story_team.sid
WHERE story_team.spid = ?
	AND task.delete_flg = 0
SQL;
    $result = DB::select($query, array($spid));
    return $result;
  }
  
}
