<?php

class Attach extends Eloquent {

  protected $table = 'attach';
  public $timestamps = false;
  public $primaryKey = 'atid';
  
  public static function getAttach($entity_id, $entity_type){
    $query = <<<SQL
SELECT attach.file_name
FROM attach
WHERE attach.entity_id = ? AND attach.entity_type = ?
SQL;
    $attach = DB::select($query, array($entity_id, $entity_type));
    $result = array();
    foreach($attach as $value){
      $result[] = $value->file_name;
    }
    return $result;
  }

}
