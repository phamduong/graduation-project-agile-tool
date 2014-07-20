@extends('layouts.default_layout')
@section('title')
Scrumtool - Report
@stop
@section('content')
<div class="container-fluid">
  <div class="row-fluid" id="report-page-content">

    <!--    <div class="span12 report-detail-temp">
        </div>-->

    <div class="span6 all-team-report-temp">
      <div class="box box-color box-bordered">
        <div class="box-title">
          <h3>
            <i class="icon-bar-chart"></i>
            All team
          </h3>
          <div class="actions">
          </div>
        </div>
        <div class="box-content">
          <div class="statistic-big">
            <div class="flot" id="flot-all-team"></div>
          </div>
        </div>
      </div>
    </div>

    <div class="span6 team-report-temp">
      <div class="scrollable" data-height="520">
        
        <div class="team-report-temp-item">
          <div class="span11">
            <div class="box box-color box-bordered">
              <div class="box-title">
                <h3>
                  <i class="icon-bar-chart"></i>
                  <span class="team-report-name">Team 1</span>
                </h3>
              </div>
              <div class="box-content">
                <div class="statistic-big">
                  <div class="flot medium team-report" id=""></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <script>
      window.report_team_list = <?php echo json_encode($team_list); ?>;
      window.report_selected_sprint = <?php echo $sprint_list[0]->spid; ?>;
    </script>
    <script>
    @if(isset($current_project))
      var current_project = {{{$current_project}}};
    @endif
    </script>
  </div>
  <script src="{{asset("js/report.js")}}"></script>
  <!-- Flot -->
  <script src="{{ asset("js/plugins/flot/jquery.flot.min.js" ) }}"></script>
  <!--<script src="{{ asset("js/plugins/flot/jquery.flot.bar.order.min.js" ) }}"></script>-->
  <script src="{{ asset("js/plugins/flot/jquery.flot.pie.min.js" ) }}"></script>
  <script src="{{ asset("js/plugins/flot/jquery.flot.resize.min.js" ) }}"></script>
  <script src="{{ asset("js/plugins/flot/jquery.flot.time.js" ) }}"></script>  
</div>
@stop