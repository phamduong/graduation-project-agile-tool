<?php

class Story extends Eloquent {

  protected $table = 'story';
  public $timestamps = false;
  public $primaryKey = 'sid';

  public function getStoryDatatables($pid) {
    $query = <<<SQL
SELECT story.sid, sprint.`name` AS sprint_name, story.name AS story_name, 
				story.priority, story.time_estimate, story.point, team.name AS team_name, story.status
FROM 
	story LEFT OUTER JOIN story_team on story.sid = story_team.sid
	LEFT OUTER JOIN sprint ON story_team.spid = sprint.spid
	LEFT OUTER JOIN team ON story_team.tid = team.tid
WHERE story.pid = ? AND story.delete_flg = 0
SQL;
    $result = array();
    $result["aaData"] = DB::select($query, array($pid));
    return $result;
  }

  public function getStory($sid) {
    $query = <<<SQL
SELECT story.sid, story.`name`, story.priority, story.time_estimate, story.point, 
story.demo, story.description, story.status,`user`.fullname AS create_user
FROM story INNER JOIN user ON story.create_user = `user`.uid
WHERE sid = ?  AND story.delete_flg = 0
SQL;
    $result = DB::select($query, array($sid));
    return $result[0];
  }

  public function approveStory($sid) {
    $query = <<<SQL
UPDATE story
SET status = ?
WHERE sid = ?
SQL;
    $result = DB::update($query, array(STORY_STATUS_APPROVED, $sid));
    return $result;
  }

  public function getStoryThatAssigned($sid) {
    $query = <<<SQL
SELECT story.*, story_team.tid
FROM story INNER JOIN story_team ON story.sid = story_team.sid
WHERE story.sid = ? AND story.delete_flg = 0
SQL;
    $result = DB::select($query, array($sid));
    return $result;
  }

  public function getStoryNotComplete($pid) {
    $query = <<<SQL
  SELECT story.*
  FROM story
  WHERE story.pid = ?
    AND story.status <> ?
    AND delete_flg = 0
SQL;
    $result = DB::select($query, array($pid, STORY_STATUS_SPRINT_COMPLETED));
    return $result;
  }

  public function updateStatusFollowTasks($sid) {
    $query = <<<SQL
SELECT task.*
FROM task INNER JOIN story_team ON task.sid = story_team.sid
INNER JOIN story ON story_team.sid = story.sid
WHERE story.sid = ?
	AND task.delete_flg = 0
SQL;
    $result = DB::select($query, array($sid));
//    return $result;
    $min_status = $result[0]->status;
    foreach ($result as $story) {
      if ($story->status < $min_status) {
        $min_status = $story->status;
      }
    }
//    return $min_status;
    $story_status = 0;
    switch ($min_status) {
      case 1:
        $story_status = STORY_STATUS_TO_DO;
        break;
      case 2:
        $story_status = STORY_STATUS_IN_PROGRESS;
        break;
      case 3:
        $story_status = STORY_STATUS_TO_TEST;
        break;
      case 4:
        $story_status = STORY_STATUS_DONE;
        break;
    }
    $query = <<<SQL
  UPDATE story 
  SET status = ?
  WHERE sid = ?
SQL;
    $result = DB::update($query, array($story_status, $sid));
    $story_status_name = '';
    switch($story_status){
      case STORY_STATUS_TO_DO:
        $story_status_name = 'To do';
        break;
      case STORY_STATUS_IN_PROGRESS:
        $story_status_name = 'In progress';
        break;
      case STORY_STATUS_TO_TEST:
        $story_status_name = 'To test';
        break;
      case STORY_STATUS_DONE:
        $story_status_name = 'Done';
        break;
    }
    $data = array('sid' => $sid, 'status' => $story_status_name);
    return $data;
  }

}
