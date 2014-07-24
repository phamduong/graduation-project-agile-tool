@extends('layouts.default_layout')
@section('title')
{{{$current_proj_name}}}
@stop
@section('content')
<div class="container-fluid">
  <div class="row-fluid" id="report-page-content">
    
    <div class="span6">
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

    <div class="span6">
      <div class="scrollable" data-height="520">
        @foreach($team_list as $team)
        <div class="span11">
          <div class="box box-color box-bordered">
            <div class="box-title">
              <h3>
                <i class="icon-bar-chart"></i>
                <span class="team-report-name">{{{$team->name}}}</span>
              </h3>
            </div>
            <div class="box-content">
              <div class="statistic-big">
                <div class="flot medium team-report" id="{{{'team_report_'. $team->tid}}}"></div>
              </div>
            </div>
          </div>
        </div>
        @endforeach
      </div>
    </div>

    <script>
      window.report_team_list = <?php echo json_encode($team_list); ?>;
      window.report_selected_sprint = <?php echo $report_selected_sprint; ?>;
    </script>
    <script>
      @if(isset($current_project))
        var current_project = {{{$current_project}}};
      @endif
    </script>
  </div>
  <script src="{{asset("js/report.js")}}"></script>
  <script src="{{asset("js/burndown_overview.js")}}"></script>
  <!-- Flot -->
  <script src="{{ asset("js/plugins/flot/jquery.flot.min.js" ) }}"></script>
  <!--<script src="{{ asset("js/plugins/flot/jquery.flot.bar.order.min.js" ) }}"></script>-->
  <script src="{{ asset("js/plugins/flot/jquery.flot.pie.min.js" ) }}"></script>
  <script src="{{ asset("js/plugins/flot/jquery.flot.resize.min.js" ) }}"></script>
  <script src="{{ asset("js/plugins/flot/jquery.flot.time.js" ) }}"></script>  
</div>
@stop