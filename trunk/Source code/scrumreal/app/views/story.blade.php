@extends('layouts.default_layout')
@section('title')
Scrumreal - User story management
@stop
@section('content')
@include('modal/story_add')
@include('modal/story_edit')
@include('modal/task_add')
<div class="container-fluid">
  <div class="row-fluid">
    <div class="span12">
      <div class="box box-color box-bordered">
        <div class="box-title">
          <h3>
            {{{$current_proj_name}}}
          </h3>
        </div>
        <div class="box-content nopadding">
          <div id="action_bar" class="row-fluid">
            <div class="span12">
              <a href="#modal-add-story" data-backdrop="static" id="btn-add-story" role="button" class="btn btn-primary pull-left btn-lightred mr10" data-toggle="modal"><i class="icon-plus"></i> Add story</a>
              <button id="btn-download-excel" class="btn btn-primary pull-right mr10"><i class="icon-download-alt"></i> Excel</button>
            </div>
          </div>
          <table class="table table-hover table-nomargin table-bordered usertable" id="user-story-datatable">
            <thead>
              <tr class='thefilter'>
                <th>Story name</th>
                <th>Priority</th>
                <th>Time estimate</th>
                <th>Point</th>
                <th>Status</th>
                <th>Sprint</th>
                <th>Team</th>
                <th>Options</th>
              </tr>
              <tr>
                <th>Story name</th>
                <th>Priority</th>
                <th>Time estimate</th>
                <th>Point</th>
                <th>Status</th>
                <th>Sprint</th>
                <th>Team</th>
                <th>Options</th>
              </tr>
            </thead>
            <tbody>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
  <script src="{{ asset("js/story.js" ) }}"></script>
  <script src="{{ asset("js/theme.js" ) }}"></script>
  <!-- dataTables -->
  <script src="{{ asset("js/plugins/datatable/jquery.dataTables.min.js") }}"></script>
  <script src="{{ asset("js/plugins/datatable/TableTools.min.js") }}"></script>
  <script src="{{ asset("js/plugins/datatable/fnReloadAjax.js") }}"></script>
  <!--<script src="//cdn.datatables.net/tabletools/2.2.1/js/dataTables.tableTools.min.js"></script>-->
  <script src="{{ asset("js/plugins/datatable/ColReorderWithResize.js") }}"></script>
  <script src="{{ asset("js/plugins/datatable/ColVis.min.js") }}"></script>
  <script src="{{ asset("js/plugins/datatable/jquery.dataTables.columnFilter.js") }}"></script>
  <script src="{{ asset("js/plugins/datatable/jquery.dataTables.grouping.js") }}"></script>
  <!-- Daterangepicker -->
  <script src="{{ asset("js/plugins/daterangepicker/daterangepicker.js") }}"></script>
  <script src="{{ asset("js/plugins/daterangepicker/moment.min.js") }}"></script>
</div>
@stop