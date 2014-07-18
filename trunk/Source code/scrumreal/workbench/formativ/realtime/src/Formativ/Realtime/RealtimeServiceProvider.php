<?php

namespace Formativ\Realtime;

use Illuminate\Support\ServiceProvider;
use Evenement\EventEmitter;
use Ratchet\Server\IoServer;

class RealtimeServiceProvider extends ServiceProvider {

  /**
   * Indicates if loading of the provider is deferred.
   *
   * @var bool
   */
  protected $defer = false;

  /**
   * Register the service provider.
   *
   * @return void
   */
  public function register() {
    $this->app->bind('realtime.emitter', function() {
      return new EventEmitter();
    });

    $this->app->bind('realtime.realtime', function() {
      return new Realtime(
              $this->app->make('realtime.emitter')
      );
    });

    $this->app->bind('realtime.user', function() {
      return new User();
    });

    $this->app->bind('realtime.command.serve', function() {
      return new Command\Serve(
              $this->app->make('realtime.realtime')
      );
    });
    
    $this->commands('realtime.command.serve');
  }

  /**
   * Get the services provided by the provider.
   *
   * @return array
   */
  public function provides() {
    return array(
        'realtime.realtime',
        'realtime.command.serve',
        'realtime.emitter',
        'realtime.server'
    );
  }

}
