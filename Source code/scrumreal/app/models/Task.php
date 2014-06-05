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
WHERE story.sid = ?
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
WHERE story_team.spid = ?
SQL;
    $result = DB::select($query, array($spid));
    return $result;
  }

  public function getStoryTaskByTeam($spid, $tid) {
    $query = <<<SQL
SELECT story.sid, story.point, story.`name` AS story_name, team.name AS team_name, story.time_estimate, story.status AS story_status
FROM story INNER JOIN story_team ON story.sid = story_team.sid 
		INNER JOIN team ON story_team.tid = team.tid
WHERE story_team.spid = ? AND story_team.tid = ?
SQL;
    $result = DB::select($query, array($spid, $tid));
    return $result;
  }

  public function getTaskInStory($sid) {
    $query = <<<SQL
SELECT task.taid, task.`name`, task.time_estimate, task.`status`, `user`.uid, `user`.image AS user_image, `user`.fullname AS user_name
FROM task LEFT JOIN `user` ON task.uid = `user`.uid
WHERE task.sid = ?
SQL;
    $result = DB::select($query, array($sid));
    return $result;
  }

  public function getTaskInStoryByUser($sid, $uid) {
    $query = <<<SQL
SELECT task.taid, task.`name`, task.time_estimate, task.`status`, `user`.uid, `user`.image AS user_image, `user`.fullname AS user_name
FROM task LEFT JOIN `user` ON task.uid = `user`.uid
WHERE task.sid = ? AND task.uid = ?
SQL;
    $result = DB::select($query, array($sid, $uid));
    return $result;
  }

}
