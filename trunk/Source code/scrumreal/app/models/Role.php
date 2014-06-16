<?php

class Role extends Eloquent {

  protected $table = 'role';
  public $timestamps = false;
  public $primaryKey = 'rid';

  public function getAllRole() {
    $query = <<<SQL
SELECT *
FROM role
ORDER BY rid
SQL;
    $result = DB::select($query);
    return $result;
  }

}
