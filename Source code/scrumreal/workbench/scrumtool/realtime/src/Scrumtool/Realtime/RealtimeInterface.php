<?php
namespace Scrumtool\Realtime;
use Ratchet\Wamp\WampServerInterface;

use Evenement\EventEmitterInterface;

interface RealtimeInterface extends WampServerInterface {
  
  public function getEmitter();
  
  public function setEmitter(EventEmitterInterface $emitter);
  
}