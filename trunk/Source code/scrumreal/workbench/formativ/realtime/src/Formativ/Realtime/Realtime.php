<?php

namespace Formativ\Realtime;

use Evenement\EventEmitterInterface;
use Ratchet\ConnectionInterface;
use Ratchet\MessageComponentInterface;
use Exception;
use SplObjectStorage;

class Realtime implements RealtimeInterface {

  protected $list_user;
  protected $emitter;

  public function __construct(EventEmitterInterface $emitter) {
    $this->emitter = $emitter;
    $this->list_user = new \SplObjectStorage();
  }

  public function getEmitter() {
    return $this->emitter;
  }

  public function getListUser() {
    return $this->list_user;
  }

  public function getUserBySocket(ConnectionInterface $socket) {
    foreach ($this->list_user as $next) {
      if ($next->getSocket() === $socket) {
        return $next;
      }
    }
    return null;
  }

  public function onClose(ConnectionInterface $conn) {
    $user = $this->getUserBySocket($conn);
    if ($user) {
      $this->list_user->detach($user);
      $this->emitter->emit('close', [$user]);
    }
  }

  public function onError(ConnectionInterface $conn, Exception $e) {
    $user = $this->getUserBySocket($conn);
    if ($user) {
      $this->list_user->detach($user);
      $this->emitter->emit('error', [$user, $e]);
    }
  }

  public function onMessage(ConnectionInterface $from, $msg) {
    $user = $this->getUserBySocket($from);
    $message = json_decode($msg);
    switch ($message->type) {
      case "project": {
          $this->emitter->emit('message', [
              $user,
              $message->data
          ]);
          break;
        }
    }

    foreach ($this->list_user as $next) {
      $next->getSocket()->send(json_encode([
          'user' => [
              'id' => $user->getId(),
              'name' => $user->getName()
          ],
          'message' => $message
      ]));
    }
  }

  public function onOpen(ConnectionInterface $conn) {
    $user = new User();
    $user->setId(Auth::user()->uid); //set to current login user id
    $user->setName(Auth::user()->name);
    $user->setSocket($conn);

    $this->list_user->attach($user);
    $this->emitter->emit('open', [$user]);
  }

  public function setEmitter(EventEmitterInterface $emitter) {
    $this->emitter = $emitter;
  }

}
