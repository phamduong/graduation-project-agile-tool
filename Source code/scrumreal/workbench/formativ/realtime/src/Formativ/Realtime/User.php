<?php

namespace Formativ\Realtime;

use Ratchet\ConnectionInterface;

class User implements UserInterface {

  protected $id;
  protected $name;
  protected $socket;

  public function getId() {
    return $this->id;
  }

  public function getName() {
    return $this->name;
  }

  public function getSocket() {
    return $this->socket;
  }

  public function setId($id) {
    $this->id = $id;
    return $this;
  }

  public function setName($name) {
    $this->name = $name;
    return $this;
  }

  public function setSocket(ConnectionInterface $socket) {
    $this->socket = $socket;
    return $this;
  }

}
