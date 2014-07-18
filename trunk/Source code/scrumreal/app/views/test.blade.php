<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />        
    <title>Laravel 4 Chat</title>
  </head>
  <body>
    <h1>Test websocket pub sub</h1>

  </body>
<script src="{{ asset("js/autobahn.min.js" ) }}"></script>
  <script>
    var conn = new ab.Session('ws://localhost:8080',
            function() {
              conn.subscribe('test_category', function(topic, data) {
                // This is where you would add the new article to the DOM (beyond the scope of this tutorial)
                console.log('New article published to category "' + topic + '" : ' + data.article);
              });
            },
            function() {
              console.warn('WebSocket connection closed');
            },
            {'skipSubprotocolCheck': true}
    );
  </script>
</html>