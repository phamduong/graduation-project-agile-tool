<?php

class Comment extends Eloquent {

  protected $table = 'comment';
  public $timestamps = false;
  public $primaryKey = 'cid';

  public function getComment($entity_id, $entity_type) {
    $query = <<<SQL
SELECT `comment`.cid, user.fullname as user_name, user.image as user_image, `comment`.content, `comment`.parent_id, comment.time
FROM `comment` INNER JOIN user ON comment.uid = user.uid
WHERE `comment`.entity_id = ? AND `comment`.entity_type = ?
ORDER BY `comment`.time DESC
SQL;
    $comments = array();
    $comments['list'] = DB::select($query, array($entity_id, $entity_type));
    if (!empty($comments['list'])) {
      foreach ($comments['list'] as $key => $comment) {
        $comments['list'][$key]->time = date('d-m-Y H:i:s', strtotime($comments['list'][$key]->time));
      }
      $comments['entity_id'] = $entity_id;
      $comments['entity_type'] = $entity_type;
    }
    return $comments;
  }

  public function countComment($entity_id, $entity_type) {
    $query = <<<SQL
SELECT count(`comment`.cid) as count
FROM `comment`
WHERE `comment`.entity_id = ? AND `comment`.entity_type = ?
SQL;
    $result = DB::select($query, array($entity_id, $entity_type));
    return $result[0]->count;
  }

}
