<?php

namespace Formativ\Realtime;

use Ratchet\MessageComponentInterface;
use Ratchet\ConnectionInterface;
use Evenement\EventEmitterInterface;

interface RealtimeInterface extends MessageComponentInterface {

  public function getUserBySocket(ConnectionInterface $socket);

  public function getEmitter();

  public function setEmitter(EventEmitterInterface $emitter);

  public function getListUser();
}
