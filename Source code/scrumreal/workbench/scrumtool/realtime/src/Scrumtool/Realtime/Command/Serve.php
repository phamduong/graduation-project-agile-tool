<?php

namespace Scrumtool\Realtime\Command;

use Scrumtool\Realtime\Pusher;
use Scrumtool\Realtime\RealtimeInterface;
use Illuminate\Console\Command;
use Ratchet\ConnectionInterface;
use Ratchet\Http\HttpServer;
use Ratchet\Server\IoServer;
use Ratchet\WebSocket\WsServer;
use React\EventLoop\Factory;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Input\InputArgument;
use Ratchet\Wamp\WampServer;
use React\Socket\Server;
use React\ZMQ\Context;
use \ZMQ;

//use \ZMQContext;


class Serve extends Command {

  protected $name = 'realtime:serve';
  protected $description = 'description here';
  protected $pusher;

  public function __construct(RealtimeInterface $pusher) {
    parent::__construct();
    $this->pusher = $pusher;

//    $this->line('<info>START SERVER</info>');

    $open = function(ConnectionInterface $conn) {
//      $message = $conn->getUri();
//      $this->line('<info>OPEN</info><comment>'.$message.'</comment>');
      $this->line('<info>OPEN</info>');
    };
    $this->pusher->getEmitter()->on('open', $open);

    $close = function(ConnectionInterface $conn) {
//      $message = print_r($conn, true);
//      $this->line('<info>CLOSE</info><comment>'.$message.'</comment>');
      $this->line('<info>CLOSE</info>');
    };
    $this->pusher->getEmitter()->on('close', $close);

    $error = function(ConnectionInterface $conn, \Exception $e) {
//      $message = print_r($conn, true);
//      $message .= print_r($e, true);
      $this->line('<info>ERROR: </info><comment>' . $e->getMessage() . '</comment>');
    };
    $this->pusher->getEmitter()->on('error', $error);

    $subscribe = function(ConnectionInterface $conn, $topic) {
//      $message = print_r($conn, true);
//      $message .= print_r($topic, true);
      $this->line('<info>SUBSCRIBE to topic: </info><comment>' . $topic . '</comment>');
//      $this->line('<info>SUBSCRIBE</info>');
    };
    $this->pusher->getEmitter()->on('subscribe', $subscribe);

    $unsubscribe = function(ConnectionInterface $conn, $topic) {
//      $message = print_r($conn, true);
//      $message .= print_r($topic, true);
      $this->line('<info>UNSUBSCRIBE from topic: </info><comment>' . $topic . '</comment>');
    };
    $this->pusher->getEmitter()->on('unsubscribe', $unsubscribe);

    $receive_data = function($data) {
//      $message = print_r($data, true);
//      $this->line('<info>RECEIVED DATA</info><comment>'.$message.'</comment>');
      $this->line('<info>RECEIVED DATA from topic: </info>'
              . '<comment>' . $data['category'] . ' with TYPE: ' . $data['type'] . '</comment>');
    };
    $this->pusher->getEmitter()->on('receive_data', $receive_data);
  }

  public function fire() {
    $loop = Factory::create();
//    $pusher = new Pusher;
    // Listen for the web server to make a ZeroMQ push after an ajax request
    $context = new Context($loop);
    $pull = $context->getSocket(ZMQ::SOCKET_PULL);
    $pull->bind('tcp://127.0.0.1:5555'); // Binding to 127.0.0.1 means the only client that can connect is itself
    $pull->on('message', array($this->pusher, 'onReceiveData'));

    // Set up our WebSocket server for clients wanting real-time updates
    $webSock = new Server($loop);
    $webSock->listen(8080, '0.0.0.0'); // Binding to 0.0.0.0 means remotes can connect
    $webServer = new IoServer(
            new HttpServer(
            new WsServer(
            new WampServer(
            $this->pusher
            )
            )
            ), $webSock
    );

    $loop->run();
  }

}
