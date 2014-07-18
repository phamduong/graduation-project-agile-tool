<?php

namespace Scrumtool\Realtime;

use Illuminate\Support\ServiceProvider;
use Evenement\EventEmitter;

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
    //
    $this->app->bind('realtime.emitter', function() {
      return new EventEmitter();
    });

    $this->app->bind('realtime.pusher', function() {
      return new Pusher(
              $this->app->make('realtime.emitter')
      );
    });

    $this->app->bind('realtime.command.serve', function() {
      return new Command\Serve(
              $this->app->make('realtime.pusher')
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
        'realtime.pusher',
        'realtime.command.serve',
        'realtime.emitter',
            //'realtime.server'
    );
  }

}
