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

}
