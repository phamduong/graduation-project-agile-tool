<?php

class Activity extends Eloquent {

  protected $table = 'activity';
  public $timestamps = false;
  public $primaryKey = 'acid';

  public function getActivity($entity_id, $entity_type, $offset, $limit) {
    $query = <<<SQL
SELECT activity.*, `user`.fullname AS user_name, `user`.image AS user_image
FROM activity INNER JOIN `user` ON activity.uid = `user`.uid
WHERE entity_id = ?
	AND entity_type = ?
ORDER BY activity.time DESC
LIMIT ?, ?
SQL;
    $result = DB::select($query, array($entity_id, $entity_type, $offset, $limit));
    return $result;
  }

  public function createActivity($type, $entity_id, $entity_type, $content, $uid) {
    $query = <<<SQL
INSERT INTO activity
	(
		type,
		entity_id,
		entity_type,
		content,
		uid
	)
VALUES
	(
		?,
		?,
		?,
		?,
		?
	)
SQL;
    $result = DB::insert($query, array($type, $entity_id, $entity_type, $content, $uid));
    return $result;
  }

}
