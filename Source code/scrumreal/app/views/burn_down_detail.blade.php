@extends('layouts.default_layout')
@section('title')
Scrumtool - Report
@stop
@section('content')
<div class="container-fluid">
  
  <div class="row-fluid" id="report-page-content">
    <div class="span12">
      <div class="box box-color box-bordered">
        <div class="box-title">
          <h3>
            <i class="icon-bar-chart"></i>
            <span class="report-detail-title"></span>
          </h3>
          <div class="actions">
          </div>
        </div>
        <div class="box-content">
          <div class="statistic-big">
            <div class="flot report-detail-content" id=""></div>
          </div>
        </div>
      </div>
    </div>

    <script>
      window.report_team_list = <?php echo json_encode($team_list); ?>;
      window.report_selected_sprint = <?php echo $report_selected_sprint; ?>;
      window.report_selected_team = <?php echo json_encode($report_selected_team); ?>;
      window.report_selected_team_name = "<?php echo $report_selected_team_name; ?>";
    </script>

  </div>
  <script src="{{asset("js/report.js")}}"></script>
  <script src="{{asset("js/burndown_detail.js")}}"></script>
  <!-- Flot -->
  <script src="{{ asset("js/plugins/flot/jquery.flot.min.js" ) }}"></script>
  <!--<script src="{{ asset("js/plugins/flot/jquery.flot.bar.order.min.js" ) }}"></script>-->
  <script src="{{ asset("js/plugins/flot/jquery.flot.pie.min.js" ) }}"></script>
  <script src="{{ asset("js/plugins/flot/jquery.flot.resize.min.js" ) }}"></script>
  <script src="{{ asset("js/plugins/flot/jquery.flot.time.js" ) }}"></script>  
</div>
@stop