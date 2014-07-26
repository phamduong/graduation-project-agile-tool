@extends('layouts.default_layout')
@section('title')
{{{$current_proj_name}}}
@stop
@section('content')
<div class="container-fluid">
  <div class="row-fluid">
    <div class="span12">
      <div class="box">
        <div class="box-title">
          <h3>
            <i class="icon-calendar"></i>
            Permission
          </h3>
        </div>
        <div class="box-content nopadding">
          <div class='alert_block'></div>
          <table id="role-permission" class="table table-hover table-nomargin">
            <thead>
              <tr>
                <th>Permission name</th>                
                <th>Not in project</th>
                <th>Project Leader</th>
                <th>Scrum Master</th>
                <th>Team member</th>
                <th>Product owner</th>                
              </tr>
            </thead>
            <tbody>
              @foreach($list_permission as $permission)
              <tr>
                <td>{{{$permission->name}}}</td>
                @for($i = 0; $i <= 4; $i++)
                @if(in_array($i, $permission->role_satus))
                <td><input type="checkbox" value="{{{$permission->peid . '_' . $i}}}" checked class="check_permission" /></td>
                @else
                <td><input type="checkbox" value="{{{$permission->peid . '_' . $i}}}" class="check_permission" /></td>
                @endif
                @endfor                  
              </tr>
              @endforeach
            </tbody>
          </table>
          <div class="permission-submit">
            <button class="btn btn-primary" id="save-permission">Save permission</button>
            <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script src="{{asset("js/permission.js")}}"></script>
  <script>
    @if(isset($current_project))
      var current_project = {{{$current_project}}};
    @endif
  </script>
</div>
@stop