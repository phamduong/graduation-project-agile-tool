@extends('layouts.default_layout')
@section('content')
<div class="container-fluid">
  <div class="row-fluid">
    <div class="span6">
      <div class="box box-color box-bordered">
        <div class="box-title">
          <h3>
            <i class="icon-bar-chart"></i>
            Release Burnup
          </h3>
          <div class="actions">
            <a href="#" class="btn btn-mini content-refresh"><i class="icon-refresh"></i></a>
            <a href="#" class="btn btn-mini content-remove"><i class="icon-remove"></i></a>
            <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i></a>
          </div>
        </div>
        <div class="box-content">
          <div class="statistic-big">
            <div class="bottom">
              <div class="flot medium" id="flot-audience"></div>
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
      <div class="box box-color lightred box-bordered">
        <div class="box-title">
          <h3>
            <i class="icon-bar-chart"></i>
            Current sprint burndown
          </h3>
          <div class="actions">
            <a href="#" class="btn btn-mini content-refresh"><i class="icon-refresh"></i></a>
            <a href="#" class="btn btn-mini content-remove"><i class="icon-remove"></i></a>
            <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i></a>
          </div>
        </div>
        <div class="box-content">
          <div class="statistic-big">
            <div class="bottom">
              <div class="flot medium" id="flot-hdd"></div>
            </div>
            <div class="bottom">
              <ul class="stats-overview">
                <li>
                  <span class="name">
                    Number of task
                  </span>
                  <span class="value">
                    20
                  </span>
                </li>
                <li>
                  <span class="name">
                    Tasks done
                  </span>
                  <span class="value">
                    9
                  </span>
                </li>
                <li>
                  <span class="name">
                    Tasks left
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
  </div>
  <div class="row-fluid">
    <div class="span6">
      <div class="box">
        <div class="box-title">
          <h3><i class="icon-calendar"></i>My calendar</h3>
        </div>
        <div class="box-content nopadding">
          <div class="calendar"></div>
        </div>
      </div>
    </div>
  </div>
</div>
@stop