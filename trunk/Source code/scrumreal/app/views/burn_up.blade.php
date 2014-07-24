@extends('layouts.default_layout')
@section('title')
{{{$current_proj_name}}}
@stop
@section('content')
<div class="container-fluid">
  
  <div class="row-fluid" id="report-page-content">
    <div class="span12">
      <div class="box box-color box-bordered">
        <div class="box-title">
          <h3>
            <i class="icon-bar-chart"></i>
            <span class="report-burnup-title">Project burn up chart</span>
          </h3>
          <div class="actions">
          </div>
        </div>
        <div class="box-content">
          <div class="statistic-big">
            <div class="flot report-burnup-content" id="report-burn-up"></div>
          </div>
        </div>
      </div>
    </div>
    <script>
      @if(isset($current_project))
        var current_project = {{{$current_project}}};
      @endif
    </script>
  </div>
  <script src="{{asset("js/report.js")}}"></script>
  <script src="{{asset("js/burnup.js")}}"></script>
  <!-- Flot -->
  <script src="{{ asset("js/plugins/flot/jquery.flot.min.js" ) }}"></script>
  <!--<script src="{{ asset("js/plugins/flot/jquery.flot.bar.order.min.js" ) }}"></script>-->
  <script src="{{ asset("js/plugins/flot/jquery.flot.pie.min.js" ) }}"></script>
  <script src="{{ asset("js/plugins/flot/jquery.flot.resize.min.js" ) }}"></script>
  <script src="{{ asset("js/plugins/flot/jquery.flot.time.js" ) }}"></script>  
</div>
@stop