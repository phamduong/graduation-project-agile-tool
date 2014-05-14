<?php

class Role extends Eloquent {
  protected $table = 'role';
  public $timestamps = false;
  public $primaryKey = 'rid';
}