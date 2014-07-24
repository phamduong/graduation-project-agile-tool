<?php

class Permission extends Eloquent {

  protected $table = 'permission';
  public $timestamps = false;
  public $primaryKey = 'peid';

  public function getUserPermission($uid, $pid) {
    if (Session::get('current_role') == ROLE_NOT_IN_PROJECT) {
      $query = <<<SQL
SELECT access_link.path, access_link.type
FROM access_link 
  INNER JOIN permission ON access_link.peid = permission.peid
  INNER JOIN role_permission ON permission.peid = role_permission.peid
  INNER JOIN role ON role_permission.rid = role.rid
WHERE role.rid = 0
SQL;
      $result = DB::select($query);
    } else {
      $query = <<<SQL
SELECT access_link.path, access_link.type
FROM `user` INNER JOIN project_user ON `user`.uid = project_user.uid
	INNER JOIN role_permission ON project_user.rid = role_permission.rid
	INNER JOIN permission ON role_permission.peid = permission.peid
	LEFT OUTER JOIN access_link ON permission.peid = access_link.peid
WHERE `user`.uid = ? AND project_user.pid = ?
HAVING access_link.path IS NOT NULL
SQL;
      $result = DB::select($query, array($uid, $pid));
    }
    return $result;
  }

  public function getAllPermission() {
    $query = <<<SQL
SELECT *
FROM permission
SQL;
    $result = DB::select($query);
    return $result;
  }

  public function getPermissionForRole($peid) {
    $query = <<<SQL
SELECT rid
FROM role_permission
WHERE peid = ?
SQL;
    $result = DB::select($query, array($peid));
    return $result;
  }

  public function getPer_Role() {
    $query = <<<SQL
SELECT CONCAT(peid, '_', rid) AS per_role
FROM role_permission
SQL;
    $result = DB::select($query);
    return $result;
  }

  public function insertPermission($rid, $peid) {
    $query = <<<SQL
INSERT INTO role_permission
VALUES (?, ?)
SQL;
    $result = DB::insert($query, array($rid, $peid));
    return $result;
  }

  public function deletePermission($rid, $peid) {
    $query = <<<SQL
DELETE FROM role_permission
WHERE rid = ? AND peid = ?
SQL;
    $result = DB::delete($query, array($rid, $peid));
    return $result;
  }

}
