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
SELECT story.point, story.`name` AS story_name, team.name AS team_name, story.time_estimate, story.status AS story_status
FROM story INNER JOIN story_team ON story.sid = story_team.sid 
		INNER JOIN team ON story_team.tid = team.tid
WHERE story_team.spid = ?
SQL;
    $result = DB::select($query, array($spid));
    return $result;
  }

}
