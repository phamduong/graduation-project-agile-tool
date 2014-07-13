<?php

class Attach extends Eloquent {

  protected $table = 'attach';
  public $timestamps = false;
  public $primaryKey = 'atid';

  public function getAttach($entity_id, $entity_type) {
    $query = <<<SQL
SELECT attach.file_name
FROM attach
WHERE attach.entity_id = ?
  AND attach.entity_type = ?
  AND attach.delete_flg = 0
SQL;
    $attach = DB::select($query, array($entity_id, $entity_type));
    $result = array();
    foreach ($attach as $value) {
      $result[] = $value->file_name;
    }
    return $result;
  }

  public function addAttach($filename, $entity_type, $entity_id) {
    $query = <<<SQL
INSERT INTO attach
  (file_name, entity_id, entity_type)
VALUES 
  (?, ?, ?);
SQL;
    $result = DB::insert($query, array($filename, $entity_id, $entity_type));
    return $result;
  }

  public function removeAttach($filename, $entity_type, $entity_id) {
    $query = <<<SQL
UPDATE attach
SET delete_flg = 1
WHERE file_name = ?
AND entity_type = ?
AND entity_id = ?
SQL;
    $result = DB::update($query, array($filename, $entity_type, $entity_id));
    return $result;
  }

}
