<?php

class Sprint extends Eloquent {

  protected $table = 'sprint';
  public $timestamps = false;
  public $primaryKey = 'spid';

  public function getStoryNotAssign($pid) {
    $query = <<<SQL
SELECT story.*
FROM story
WHERE story.sid NOT IN
(
	SELECT story.sid
	FROM story INNER JOIN story_team ON story.sid = story_team.sid
	WHERE story.pid = ?
) AND story.pid = ? AND delete_flg = 0
ORDER BY story.name
SQL;
    $result = DB::select($query, array($pid, $pid));
    return $result;
  }

  public function getSprintInProject($pid) {
    $query = <<<SQL
SELECT *
FROM sprint
WHERE sprint.pid = ? AND delete_flg = 0
SQL;
    $result = DB::select($query, array($pid));
    return $result;
  }

  public function getStoryInSprint($spid, $tid) {
    $query = <<<SQL
SELECT story.sid, story.`name`, story.point, story_team.order
FROM story INNER JOIN story_team ON story.sid = story_team.sid
WHERE story_team.tid = ? AND story_team.spid = ? AND delete_flg = 0
ORDER BY story_team.order
SQL;
    $result = DB::select($query, array($tid, $spid));
    return $result;
  }

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
  
  public function getSprintNotComplete($pid){
    $query = <<<SQL
SELECT *
FROM sprint
WHERE sprint.pid = ? AND sprint.status <> ? AND delete_flg = 0
SQL;
    $result = DB::select($query, array($pid, SPRINT_STATUS_COMPLETED));
    return $result;
  }

}
