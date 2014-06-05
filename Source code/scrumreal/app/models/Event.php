<?php

class Event extends Eloquent {

  protected $table = 'event';
  public $timestamps = false;
  public $primaryKey = 'evid';
}