<?php

namespace Scrumtool\Realtime;

use Ratchet\ConnectionInterface;
use Ratchet\Wamp\WampServerInterface;
use Evenement\EventEmitterInterface;

/**
 * Not accepting any incoming messages from WebSockets, those will all be coming from Ajax
 * so we will not use onCall and onPublish
 */
class Pusher implements RealtimeInterface {

  protected $subscribedTopics = array();
  protected $emitter;

  public function __construct(EventEmitterInterface $emitter){
    $this->emitter = $emitter;
  }

  public function onCall(ConnectionInterface $conn, $id, $topic, array $params) {
    // In this application if clients send data it's because the user hacked around in console
    $conn->callError($id, $topic, 'You are not allowed to make calls')->close();
  }

  public function onClose(ConnectionInterface $conn) {
    $this->emitter->emit('close', [$conn]);
  }

  public function onError(ConnectionInterface $conn, \Exception $e) {
    $this->emitter->emit('error', [$conn, $e]);
  }

  public function onOpen(ConnectionInterface $conn) {
    $this->emitter->emit('open', [$conn]);
  }

  public function onPublish(ConnectionInterface $conn, $topic, $event, array $exclude, array $eligible) {
    // In this application if clients send data it's because the user hacked around in console
    $conn->close();
  }

  public function onSubscribe(ConnectionInterface $conn, $topic) {
    $this->subscribedTopics[$topic->getId()] = $topic;
    
    $this->emitter->emit('subscribe', [$conn, $topic]);
  }

  public function onUnSubscribe(ConnectionInterface $conn, $topic) {
    $this->emitter->emit('unsubscribe', [$conn, $topic]);
  }

  public function onReceiveData($rcv_data) {
    $data = json_decode($rcv_data, true);
    //If the look up topic is not set, there is no one to publish to
    if (!array_key_exists($data['category'], $this->subscribedTopics)) {
      return;
    }
    $topic = $this->subscribedTopics[$data['category']];

    // re-send the data to all the clients subscribed to that category
    $topic->broadcast($data);
    
    $this->emitter->emit('receive_data', [$data]);
  }

  public function getEmitter() {
    return $this->emitter;
  }

  public function setEmitter(EventEmitterInterface $emitter) {
    $this->emitter = $emitter;
  }

}
