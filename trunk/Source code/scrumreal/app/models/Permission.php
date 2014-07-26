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
WHERE role.rid = 0 AND role_permission.pid = ?
SQL;
      $result = DB::select($query, array($pid));
    } else {
      $query = <<<SQL
SELECT access_link.path, access_link.type
FROM `user` INNER JOIN project_user ON `user`.uid = project_user.uid
	INNER JOIN role_permission ON project_user.rid = role_permission.rid
	INNER JOIN permission ON role_permission.peid = permission.peid
	LEFT OUTER JOIN access_link ON permission.peid = access_link.peid
WHERE `user`.uid = ? AND project_user.pid = ? AND role_permission.pid = ?
HAVING access_link.path IS NOT NULL
SQL;
      $result = DB::select($query, array($uid, $pid, $pid));
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

  public function getPermissionForRole($peid, $pid) {
    $query = <<<SQL
SELECT rid
FROM role_permission
WHERE peid = ? AND role_permission.pid = ?
SQL;
    $result = DB::select($query, array($peid, $pid));
    return $result;
  }

  public function getPer_Role($pid) {
    $query = <<<SQL
SELECT CONCAT(peid, '_', rid) AS per_role
FROM role_permission
WHERE role_permission.pid = ?
SQL;
    $result = DB::select($query, array($pid));
    return $result;
  }

  public function insertPermission($rid, $peid, $pid) {
    $query = <<<SQL
INSERT INTO role_permission
VALUES (?, ?, ?)
SQL;
    $result = DB::insert($query, array($rid, $peid, $pid));
    return $result;
  }

  public function deletePermission($rid, $peid, $pid) {
    $query = <<<SQL
DELETE FROM role_permission
WHERE rid = ? AND peid = ? AND pid = ?
SQL;
    $result = DB::delete($query, array($rid, $peid, $pid));
    return $result;
  }

  public function insertDefaultPermission($pid) {
    $role_per_list = array(
        ROLE_NOT_IN_PROJECT => array(3, 5, 12, 25, 26, 28, 30, 38, 40, 48, 53, 55, 71, 74, 78, 82),
        ROLE_LEADER => array(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 82, 83),
        ROLE_SCRUM_MASTER => array(3, 4, 5, 6, 7, 8, 9, 12, 19, 22, 23, 24, 25, 27, 28, 29, 30, 38, 47, 48, 49, 53, 55, 59, 60, 70, 71, 72, 73, 74, 75, 77, 78, 82),
        ROLE_MEMBER => array(3, 4, 5, 6, 7, 8, 12, 19, 22, 23, 24, 25, 27, 28, 29, 30, 38, 47, 48, 49, 53, 55, 59, 71, 74, 77, 78, 82),
        ROLE_OWNER => array(3, 4, 5, 12, 20, 21, 22, 23, 24, 26, 27, 28, 29, 30, 38, 48, 53, 54, 55, 59, 71, 74, 78, 82)
    );
    $query = <<<SQL
INSERT INTO role_permission
VALUES (?, ?, ?)
SQL;
    foreach ($role_per_list as $role => $pers) {
      foreach ($pers as $p) {
        DB::insert($query, array($role, $p, $pid));
      }
    }
  }

  public function deleteProjectPermission($pid) {
    $query = <<<SQL
DELETE
FROM role_permission
WHERE pid = ?
SQL;
    $result = DB::delete($query, array($pid));
    return $result;
  }

}
