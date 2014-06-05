@extends('layouts.default_layout')
@section('title')
Scrumreal - Event management
@stop
@section('content')
@include('modal/event_add')
@include('modal/event_edit')
<div class="container-fluid">
  <div class="row-fluid">
    <div class="span12">
      <div class="box">
        <div class="box-title">
          <h3>
            <i class="icon-calendar"></i>
            Calendar
          </h3>
        </div>
        <div class="box-content nopadding">
          <div class="calendar" id="user-calendar"></div>
        </div>
      </div>
    </div>
  </div>
  <script src="{{asset("js/calendar.js")}}"></script>
</div>
@stop