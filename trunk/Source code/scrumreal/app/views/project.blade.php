@extends('layouts.default_layout')
@section('title')
Scrumtool - Project management
@stop
@section('content')
@include('modal/project_add')
@include('modal/project_edit')
@include('modal/user_add', $role)
<div class="container-fluid">
  <div class="row-fluid">
    <div class="span12">
      <div class="box box-color box-bordered">
        <div class="box-title">
          <h3>
            Projects
          </h3>
        </div>
        <div class="box-content nopadding">
          <div class='alert_block'></div>
          <div id="action_bar" class="row-fluid">
            <div class="span12">
              <a data-backdrop="static" data-keyboard="false" id="btn-add-project" role="button" class="btn btn-primary pull-left btn-lightred mr10"><i class="icon-plus"></i> Add Project</a>
              <!--<button id="btn-download-excel" class="btn btn-primary pull-right mr10"><i class="icon-download-alt"></i> Excel</button>-->
            </div>
          </div>
          <table class="table table-hover table-nomargin table-bordered usertable" id="project-datatable">
            <col/>
            <col/>
            <col/>
            <col/>
            <col/>
            <col/>
            <col/>
            <col/>
            <thead>
              <tr class='thefilter'>
                <th>Project name</th>
                <th>Product Owner</th>
                <th>Project Leader</th>
                <th>Start date</th>
                <th>End date</th>
                <th>Status</th>
                <th>Options</th>
              </tr>
              <tr>
                <th>Project name</th>
                <th>Product Owner</th>
                <th>Project Leader</th>
                <th>Start date</th>
                <th>End date</th>
                <th>Status</th>
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
  <script>
    @if(isset($current_project))
      var current_project = {{{$current_project}}};
      window.has_select_project = true;
    @else
      window.has_select_project = false;
    @endif       
  </script>
  <script src="{{ asset("js/project.js" ) }}"></script>
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