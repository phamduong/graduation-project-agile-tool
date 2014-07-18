<?php

namespace Formativ\Realtime\Command;

use Illuminate\Console\Command;
use Formativ\Realtime\RealtimeInterface;
use Formativ\Realtime\UserInterface;
use Ratchet\ConnectionInterface;
use Ratchet\Http\HttpServer;
use Ratchet\Server\IoServer;
use Ratchet\WebSocket\WsServer;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Input\InputArgument;

class Serve extends Command {

  protected $name = 'realtime:serve';
  protected $description = 'description here';
  protected $realtime;

  protected function getUserName(User $user) {
    $suffix = '(' . $user->getId() . ')';
    if ($name = $user->getName()) {
      return $name . $suffix;
    }
    return 'User' . $suffix;
  }

  public function __construct(RealtimeInterface $realtime) {
    parent::__construct();
    $this->realtime = $realtime;

    $open = function(UserInterface $user) {
      $name = $this->getUserName($user);
      $this->line("<info>" . $name . " connected.</info>");
    };
    $this->realtime->getEmitter()->on('open', $open);

    $close = function(UserInterface $user) {
      $name = $this->getUserName($user);
      $this->line("
                <info>New message from " . $name . ":</info> 
                <comment>" . $message . "</comment>
                <info>.</info>
            ");
    };
    $this->realtime->getEmitter()->on('close', $close);

    $error = function(UserInterface $user, $exception) {
      $message = $exception->getMessage();
      $this->line("
                <info>User encountered an exception:</info> 
                <comment>" . $message . "</comment>
                <info>.</info>
            ");
    };
    $this->realtime->getEmitter()->on('error', $error);
  }

  public function fire() {
    $port = (integer) $this->option("port");
    if (!$port) {
      $port = 7778;
    }
    $server = IoServer::factory
                    (
                    new HttpServer
                    (
                    new WsServer
                    (
                    $this->realtime
                    )
                    ), $port
    );
    $this->line("
            <info>Listening on port</info>
            <comment>" . $port . "</comment>
            <info>.</info>
        ");
    $server->run();
  }

  protected function getOptions() {
    return [
        [
            "port",
            null,
            InputOption::VALUE_REQUIRED,
            "Port to listen on.",
            null
        ]
    ];
  }

}
