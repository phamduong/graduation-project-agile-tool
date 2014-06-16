<?php

class Permission extends Eloquent {

  protected $table = 'permission';
  public $timestamps = false;
  public $primaryKey = 'peid';

  public function getUserPermission($uid, $pid) {
    $query = <<<SQL
SELECT permission.path, permission.type
FROM `user` INNER JOIN project_user ON `user`.uid = project_user.uid
	INNER JOIN role_permission ON project_user.rid = role_permission.rid
	INNER JOIN permission ON role_permission.peid = permission.peid
WHERE `user`.uid = ? AND project_user.pid = ?
SQL;
    $result = DB::select($query, array($uid, $pid));
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
