<?php

class Sprint extends Eloquent {

  protected $table = 'sprint';
  public $timestamps = false;
  public $primaryKey = 'spid';

  /**
   * Only appoved story 
   * @param type $pid
   * @return type
   */
  public function getStoryNotAssign($pid) {
    $query = <<<SQL
SELECT story.*
FROM story
WHERE story.sid NOT IN
  (
    SELECT story.sid
    FROM story INNER JOIN story_team ON story.sid = story_team.sid
    WHERE story.pid = ?
  )
  AND story.pid = ? AND delete_flg = 0 AND story.status > ?
ORDER BY story.name
SQL;
    $result = DB::select($query, array($pid, $pid, STORY_STATUS_NEW));
    return $result;
  }

  public function getSprintInProject($pid) {
    $query = <<<SQL
SELECT spid, pid, name, description, IFNULL(start_date, start_date_es) AS start_date, 
IF(`status` = 3, end_date, end_date_es) AS end_date, `status`, delete_flg, start_date_es
FROM sprint
WHERE sprint.pid = ? AND delete_flg = 0
SQL;
    $result = DB::select($query, array($pid));
    return $result;
  }

  public function getStoryInSprint($spid, $tid) {
    $query = <<<SQL
SELECT story.sid, story.`name`, story.status, story.time_estimate, story.point, story_team.order, story.time_estimate
FROM story INNER JOIN story_team ON story.sid = story_team.sid
WHERE story_team.tid = ? AND story_team.spid = ? AND delete_flg = 0
ORDER BY story_team.order
SQL;
    $result = DB::select($query, array($tid, $spid));
    return $result;
  }

//  public function getAllStoryInSprint($spid){
//    $query = <<<SQL
//
//SQL;
//  }

  public function getSprintDetail($spid) {
    $query = <<<SQL
SELECT *
FROM sprint 
WHERE sprint.spid = ?
SQL;
    $result = DB::select($query, array($spid));
    return $result[0];
  }

  public function addStoryToSprint($select_sid, $end_spid, $end_tid, $order) {
    $query = <<<SQL
INSERT INTO story_team VALUES(?, ?, ?, ?)
SQL;
    $result = DB::insert($query, array($select_sid, $end_tid, $end_spid, $order));
    return $result;
  }

  public function removeStoryFromSprint($select_sid, $start_spid, $start_tid) {
    $query = <<<SQL
DELETE FROM story_team
WHERE sid = ?
  AND tid = ?
  AND spid = ?
SQL;
    $result = DB::delete($query, array($select_sid, $start_tid, $start_spid));
    return $result;
  }

  public function moveStoryToSrpint($end_tid, $end_spid, $order, $select_sid, $start_tid, $start_spid) {
    $query = <<<SQL
UPDATE story_team
SET
  story_team.tid = ?,
  story_team.spid = ?,
  story_team.order = ?
WHERE
  sid = ?
  AND tid = ?
  AND spid = ?
SQL;
    $result = DB::update($query, array($end_tid, $end_spid, $order, $select_sid, $start_tid, $start_spid));
    return $result;
  }

  public function updateStoryOrder($tid, $spid, $data) {
    $query = <<<SQL
UPDATE story_team
SET
  story_team.order = ?
WHERE
  tid = ?
  AND spid = ?
  AND sid = ?
SQL;
    foreach ($data as $key => $value) {
      DB::update($query, array($value, $tid, $spid, $key));
    }
  }

  public function getSprintNotComplete($pid) {
    $query = <<<SQL
SELECT *
FROM sprint
WHERE sprint.pid = ? AND sprint.status <> ? AND delete_flg = 0
SQL;
    $result = DB::select($query, array($pid, SPRINT_STATUS_COMPLETED));
    return $result;
  }

  public function getSprintByStatus($status, $pid) {
    $query = <<<SQL
  SELECT *
  FROM sprint
  WHERE sprint.status = ?
    AND delete_flg = 0
    AND pid = ?
SQL;
    $result = DB::select($query, array($status, $pid));
    return $result;
  }

  public function getTeamDay($spid, $tid) {
    $query = <<<SQL
  SELECT *
  FROM sprint_team
  WHERE spid = ? AND tid = ?
SQL;
    $result = DB::select($query, array($spid, $tid));
    return $result[0]->num_day;
  }

  public function updateTeamDay($spid, $tid, $num_day) {
    $query = <<<SQL
  UPDATE sprint_team
  SET num_day = ?
  WHERE spid = ? AND tid = ?
SQL;
    $result = DB::select($query, array($num_day, $spid, $tid));
    return $result;
  }

  public function getTeamDayAll($pid) {
    $query = <<<SQL
SELECT sprint_team.*
FROM sprint_team INNER JOIN sprint ON sprint_team.spid = sprint.spid
WHERE sprint.pid = ?  
SQL;
    $result = DB::select($query, array($pid));
    return $result;
  }

  public function removeUnCompletedStory($spid) {
    $query = <<<SQL
SELECT story.sid
    FROM story_team INNER JOIN story ON story_team.sid = story.sid
    WHERE story.status <> 8 AND story_team.spid = ?
SQL;
    $result = DB::select($query, array($spid));

    $query = <<<SQL
DELETE FROM story_team
WHERE sid = ?
SQL;
    foreach ($result as $key => $val) {
      DB::delete($query, array($val->sid));
    }
    return $result;
  }

  public function updateStoryStatusInSprint($spid, $story_status) {
    $query = <<<SQL
UPDATE story
SET status = ?
WHERE sid IN (
	SELECT story_team.sid
	FROM story_team
	WHERE story_team.spid = ?
)
SQL;
    $result = DB::update($query, array($story_status, $spid));
    return $result;
  }

  public function getMaxEndDate($pid) {
    $query = <<<SQL
SELECT MAX(sprint.end_date_es) AS max_end_date_es
FROM sprint
WHERE sprint.pid = ? AND sprint.delete_flg = 0
SQL;
    $result = DB::select($query, array($pid));
    return $result[0]->max_end_date_es;
  }

  public function getUncompletedStory($spid) {
    $query = <<<SQL
SELECT story.sid, story.`name`
FROM story INNER JOIN story_team
ON story.sid = story_team.sid
WHERE story_team.spid = ? AND story.`status` < 8
SQL;
    $result = DB::select($query, array($spid));
    return $result;
  }

}
