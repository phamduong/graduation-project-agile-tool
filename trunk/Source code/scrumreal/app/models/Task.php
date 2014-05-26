<?php

class Task extends Eloquent {
  protected $table = 'task';
  public $timestamps = false;
  public $primaryKey = 'taid';
}
