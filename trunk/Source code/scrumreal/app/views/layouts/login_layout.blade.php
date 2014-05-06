<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <!-- Apple devices fullscreen -->
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <!-- Apple devices fullscreen -->
    <meta names="apple-mobile-web-app-status-bar-style" content="black-translucent" />

    <title>SCRUM REAL - Login</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="{{ asset("css/bootstrap.min.css") }}">
    <!-- Bootstrap responsive -->
    <link rel="stylesheet" href="{{ asset("css/bootstrap-responsive.min.css") }}">
    <!-- icheck -->
    <link rel="stylesheet" href="{{ asset("css/plugins/icheck/all.css") }}">
    <!-- Theme CSS -->
    <link rel="stylesheet" href="{{ asset("css/style__not-minified.css") }}">
    <!-- Color CSS -->
    <link rel="stylesheet" href="{{ asset("css/themes.css") }}">
    <link rel="stylesheet" href="{{ asset("css/new.css") }}">
    <link rel="stylesheet" href="{{ asset("css/font.css") }}">

    <!-- jQuery -->
    <script src="{{ asset("js/jquery.min.js") }}"></script>

    <!-- Nice Scroll -->
    <script src="{{ asset("js/plugins/nicescroll/jquery.nicescroll.min.js") }}"></script>
    <!-- Validation -->
    <script src="{{ asset("js/plugins/validation/jquery.validate.min.js") }}"></script>
    <script src="{{ asset("js/plugins/validation/additional-methods.min.js") }}"></script>
    <!-- icheck -->
    <script src="{{ asset("js/plugins/icheck/jquery.icheck.min.js") }}"></script>
    <!-- Bootstrap -->
    <script src="{{ asset("js/bootstrap.min.js") }}"></script>
    <script src="{{ asset("js/eakroko.js") }}"></script>
    <script src="{{ asset("js/theme.js") }}"></script>
    <script src="{{ asset("js/login.js") }}"></script>
    @yield('keylang')
    
    <!-- Favicon -->
    <link rel="shortcut icon" href="img/favicon.ico" />
    <!-- Apple devices Homescreen icon -->
    <link rel="apple-touch-icon-precomposed" href="img/apple-touch-icon-precomposed.png" />

  </head>

  <body class='login'>
    <noscript>Sorry, your browser does not support JavaScript!</noscript>
    @yield('content')
  </body>

</html>
