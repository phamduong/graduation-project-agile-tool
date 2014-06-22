@extends('layouts.default_layout')
@section('title')
Scrumreal - Report
@stop
@section('content')
<div class="container-fluid">
  <div class="row-fluid">
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
            <div class="bottom">
              <div class="flot" id="flot-all-team"></div>
            </div>
            <div class="bottom">
              <ul class="stats-overview">
                <li>
                  <span class="name">
                    Time left
                  </span>
                  <span class="value">
                    10 days
                  </span>
                </li>
                <li>
                  <span class="name">
                    Points done
                  </span>
                  <span class="value">
                    9
                  </span>
                </li>
                <li>
                  <span class="name">
                    Points left
                  </span>
                  <span class="value">
                    8
                  </span>
                </li>
                <li>
                  <span class="name">
                    Done
                  </span>
                  <span class="value">
                    60%
                  </span>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <div class="span6">
      <div class="scrollable"  data-height="520">
        <div class="span6">
          <div class="box box-color box-bordered">
            <div class="box-title">
              <h3>
                <i class="icon-bar-chart"></i>
                Team 1
              </h3>
              <div class="actions">
              </div>
            </div>
            <div class="box-content">
              <div class="statistic-big">
                <div class="bottom">
                  <div class="flot medium" id="flot-hdd"></div>
                </div>
                <div class="bottom">
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script src="{{asset("js/report.js")}}"></script>
  <!-- Flot -->
  <script src="{{ asset("js/plugins/flot/jquery.flot.min.js" ) }}"></script>
  <script src="{{ asset("js/plugins/flot/jquery.flot.bar.order.min.js" ) }}"></script>
  <script src="{{ asset("js/plugins/flot/jquery.flot.pie.min.js" ) }}"></script>
  <script src="{{ asset("js/plugins/flot/jquery.flot.resize.min.js" ) }}"></script>
  <script src="{{ asset("js/plugins/flot/jquery.flot.time.js" ) }}"></script>  
</div>
@stop