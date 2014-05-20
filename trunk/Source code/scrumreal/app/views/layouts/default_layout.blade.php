<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <!-- Apple devices fullscreen -->
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <!-- Apple devices fullscreen -->
    <!--<meta names="apple-mobile-web-app-status-bar-style" content="black-translucent" />-->
    <title>@yield('title', 'Scrumreal')</title>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="{{ asset("css/bootstrap.min.css" ) }}">
    <!--Bootstrap modal-->
    <link rel="stylesheet" href="css/plugins/bootstrap-modal/bootstrap-modal.css">
    <!-- Bootstrap responsive -->
    <link rel="stylesheet" href="{{ asset("css/bootstrap-responsive.min.css" ) }}">
    <!-- jQuery UI -->
    <link rel="stylesheet" href="{{ asset("css/plugins/jquery-ui/smoothness/jquery-ui.css" ) }}">
    <link rel="stylesheet" href="{{ asset("css/plugins/jquery-ui/smoothness/jquery.ui.theme.css" ) }}">
    <!-- PageGuide -->
    <link rel="stylesheet" href="{{ asset("css/plugins/pageguide/pageguide.css" ) }}">
    <!-- Fullcalendar -->
    <link rel="stylesheet" href="{{ asset("css/plugins/fullcalendar/fullcalendar.css" ) }}">
    <link rel="stylesheet" href="{{ asset("css/plugins/fullcalendar/fullcalendar.print.css") }}" media="print">
    <!-- chosen -->
    <link rel="stylesheet" href="{{ asset("css/plugins/chosen/chosen.css" ) }}">
    <!-- select2 -->
    <link rel="stylesheet" href="{{ asset("css/plugins/select2/select2.css" ) }}">
    <!-- icheck -->
    <link rel="stylesheet" href="{{ asset("css/plugins/icheck/all.css" ) }}">
    <!-- Theme CSS -->
    <link rel="stylesheet" href="{{ asset("css/style__not-minified.css" ) }}">
    <!-- Update bootstrap -->
    <link rel="stylesheet" href="{{ asset("css/bootstrap_update.css") }}">
    <!-- Daterangepicker -->
    <link rel="stylesheet" href="css/plugins/daterangepicker/daterangepicker.css">
    <!-- Color CSS -->
    <link rel="stylesheet" href="{{ asset("css/themes.css" ) }}">
    <!-- Plupload -->
    <link rel="stylesheet" href="{{ asset("css/plugins/plupload/jquery.plupload.queue.css" ) }}">
    <!-- New CSS (supplement) -->
    <link rel="stylesheet" href="{{ asset("css/new.css" ) }}">
    <link rel="stylesheet" href="{{ asset("css/font.css") }}">
    <!-- jQuery -->
    <script src="{{ asset("js/jquery.min.js" ) }}"></script>
    <!-- Nice Scroll -->
    <script src="{{ asset("js/plugins/nicescroll/jquery.nicescroll.min.js" ) }}"></script>
    <!-- jQuery UI -->
    <script src="{{ asset("js/plugins/jquery-ui/jquery.ui.core.min.js" ) }}"></script>
    <script src="{{ asset("js/plugins/jquery-ui/jquery.ui.widget.min.js" ) }}"></script>
    <script src="{{ asset("js/plugins/jquery-ui/jquery.ui.mouse.min.js" ) }}"></script>
    <script src="{{ asset("js/plugins/jquery-ui/jquery.ui.position.min.js" ) }}"></script>
    <script src="{{ asset("js/plugins/jquery-ui/jquery.ui.draggable.min.js" ) }}"></script>
    <script src="{{ asset("js/plugins/jquery-ui/jquery.ui.droppable.min.js" ) }}"></script>
    <script src="{{ asset("js/plugins/jquery-ui/jquery.ui.resizable.min.js" ) }}"></script>
    <script src="{{ asset("js/plugins/jquery-ui/jquery.ui.sortable.min.js" ) }}"></script>
    <script src="{{ asset("js/plugins/jquery-ui/jquery.ui.datepicker.min.js" ) }}"></script>
    <script src="{{ asset("js/plugins/jquery-ui/jquery.ui.dialog.min.js" ) }}"></script>
    <!-- Touch enable for jquery UI -->
    <script src="{{ asset("js/plugins/touch-punch/jquery.touch-punch.min.js" ) }}"></script>
    <!-- slimScroll -->
    <script src="{{ asset("js/plugins/slimscroll/jquery.slimscroll.min.js" ) }}"></script>
    <!-- Bootstrap -->
    <script src="{{ asset("js/bootstrap.min.js" ) }}"></script>
    <!-- Bootstrap modal -->
    <script src="js/plugins/bootstrap-modal/bootstrap-modal.js"></script>
    <script src="js/plugins/bootstrap-modal/bootstrap-modalmanager.js"></script>
    <!-- vmap -->
    <script src="{{ asset("js/plugins/vmap/jquery.vmap.min.js" ) }}"></script>
    <script src="{{ asset("js/plugins/vmap/jquery.vmap.world.js" ) }}"></script>
    <script src="{{ asset("js/plugins/vmap/jquery.vmap.sampledata.js" ) }}"></script>
    <!-- Bootbox -->
    <script src="{{ asset("js/plugins/bootbox/jquery.bootbox.js" ) }}"></script>
    <!-- Notify -->
    <script src="js/plugins/gritter/jquery.gritter.min.js"></script>
    <!-- Flot -->
    <script src="{{ asset("js/plugins/flot/jquery.flot.min.js" ) }}"></script>
    <script src="{{ asset("js/plugins/flot/jquery.flot.bar.order.min.js" ) }}"></script>
    <script src="{{ asset("js/plugins/flot/jquery.flot.pie.min.js" ) }}"></script>
    <script src="{{ asset("js/plugins/flot/jquery.flot.resize.min.js" ) }}"></script>
    <!-- imagesLoaded -->
    <script src="{{ asset("js/plugins/imagesLoaded/jquery.imagesloaded.min.js" ) }}"></script>
    <!-- PageGuide -->
    <script src="{{ asset("js/plugins/pageguide/jquery.pageguide.js" ) }}"></script>
    <!-- FullCalendar -->
    <script src="{{ asset("js/plugins/fullcalendar/fullcalendar.min.js" ) }}"></script>
    <!-- Chosen -->
    <script src="{{ asset("js/plugins/chosen/chosen.jquery.min.js" ) }}"></script>
    <!-- select2 -->
    <script src="{{ asset("js/plugins/select2/select2.min.js" ) }}"></script>
    <!-- icheck -->
    <script src="{{ asset("js/plugins/icheck/jquery.icheck.min.js" ) }}"></script>
    <!-- Jquery form -->
    <script src="{{ asset("js/plugins/form/jquery.form.min.js" ) }}"></script>
    <!-- Validation -->
    <script src="{{ asset("js/plugins/validation/jquery.validate.min.js" ) }}"></script>
    <script src="{{ asset("js/plugins/validation/additional-methods.min.js" ) }}"></script>
    <!-- Daterangepicker -->
    <script src="{{ asset("js/plugins/daterangepicker/daterangepicker.js" ) }}"></script>
    <script src="{{ asset("js/plugins/daterangepicker/moment.min.js" ) }}"></script>
    <!-- icheck -->
    <script src="{{ asset("js/plugins/icheck/jquery.icheck.min.js") }}"></script>
    <!-- Sparkline -->
    <script src="{{ asset("js/plugins/sparklines/jquery.sparklines.min.js" ) }}"></script>
    <!-- Custom file upload -->
    <script src="{{ asset("js/plugins/fileupload/bootstrap-fileupload.min.js" ) }}"></script>
    <!-- PLUpload -->
    <!--<script src="{{ asset("js/plugins/plupload/plupload.full.js" ) }}"></script>
    <script src="{{ asset("js/plugins/plupload/jquery.plupload.queue.js" ) }}"></script>-->
    <!-- Theme framework -->
    <script src="{{ asset("js/eakroko.js" ) }}"></script>
    <!-- Theme scripts -->
    <script src="{{ asset("js/application.js" ) }}"></script>
    <!-- For chatting -->
    <script src="{{ asset("js/chat.js" ) }}"></script>
    <!-- Just for demonstration -->
    <script src="{{ asset("js/demonstration.js" ) }}"></script>
    <!-- Dashboard javascript -->
    <script src="{{ asset("js/dash_board.js" ) }}"></script>
    <!--Scrumreal common-->
    <script src="{{ asset("js/comment.js" ) }}"></script>
    <script src="{{ asset("js/theme.js" ) }}"></script>
    <!-- Favicon -->
    <link rel="shortcut icon" href="img/favicon.ico" />
    <!-- Apple devices Homescreen icon -->
    <link rel="apple-touch-icon-precomposed" href="img/apple-touch-icon-precomposed.png" />
  </head>
  <body data-layout-topbar="fixed">
    <noscript>Sorry, your browser does not support JavaScript!</noscript>
    @include('modal/error_notice')
    <div id="navigation">
      @include('layouts/main_nav')
    </div>
    <div class="container-fluid" id="content">
      <div id="left" class='force-full no-resize'>
        @include('layouts/sub_nav')
      </div>
      <div id="main">
        @yield('content')
      </div>
    </div>
  </body>
</html>