<?php

class Team extends Eloquent {

  protected $table = 'team';
  public $timestamps = false;
  public $primaryKey = 'tid';

  public function getTeamList($pid) {
    $query = <<<SQL
SELECT team.tid, team.name, team.description, team.`master`, user.fullname, user.image
FROM team INNER JOIN user ON team.`master` = user.uid
	INNER JOIN project ON team.pid = project.pid
WHERE project.pid = ?
SQL;
    $result = DB::select($query, array($pid));
    return $result;
  }

}
