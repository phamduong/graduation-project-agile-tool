<?php

class Story extends Eloquent {

  protected $table = 'story';
  public $timestamps = false;
  public $primaryKey = 'sid';

  public function getStoryDatatables() {
    $query = <<<SQL
SELECT story.sid, sprint.`name` AS sprint_name, story.name AS story_name, 
				story.priority, story.time_estimate, story.point, team.name AS team_name, story.status
FROM 
	story INNER JOIN project ON story.pid = project.pid
	LEFT OUTER JOIN sprint ON story.spid = sprint.spid
	LEFT OUTER JOIN story_team ON story.sid = story_team.sid LEFT OUTER JOIN team ON story_team.tid = team.tid
WHERE project.pid = 1            
SQL;
    $result = array();
    $result["aaData"] = DB::select($query);
    return $result;
  }
  
  public function getStory(){
    
  }

}
