<?php

use \ZMQContext;

class PushController extends BaseController {

  public static function publishData($data) {
    // This is our new stuff
    $context = new ZMQContext();
    $socket = $context->getSocket(ZMQ::SOCKET_PUSH, 'my pusher');
    $socket->connect("tcp://127.0.0.1:5555");

    $socket->send(json_encode($data));
  }

}
