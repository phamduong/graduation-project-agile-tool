@extends('layouts.default_layout')
@section('title')
{{{$current_proj_name}}}
@stop
@section('content')
<div class="container-fluid">
  <div class="row-fluid">
    <div class="span12">
      <div class="box box-color box-bordered">
        <div class="box-title">
          <h3>
            Users list
          </h3>
        </div>
        <div class="box-content nopadding">
          <div id="action_bar" class="row-fluid">
            <div class="span12">
              <a href="#" data-backdrop="static" id="btn-add-user" role="button" class="btn btn-primary pull-left btn-lightred mr10" data-toggle="modal"><i class="icon-plus"></i> Add user</a>
              <!--<button id="btn-download-excel" class="btn btn-primary pull-right mr10"><i class="icon-download-alt"></i> Excel</button>-->
            </div>
          </div>
          <table class="table table-hover table-nomargin table-bordered usertable" id="users_list_datatable">          
            <thead>
              <tr class='thefilter'>
                <th>User name</th>
                <th>Birthday</th>
                <th>Current project</th>
                <th>Number of attendance project</th>
                <th>Options</th>
              </tr>
              <tr>
                <th>User name</th>
                <th>Birthday</th>
                <th>Current project</th>
                <th>Number of attendance project</th>
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
    @if (isset($current_project))
            var current_project = {{{$current_project}}};
            @endif
  </script>
  <script src="{{ asset("js/users.js" ) }}"></script>
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
@include('modal/user_edit')
@stop