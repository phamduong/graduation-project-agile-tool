@extends('layouts.default_layout')
@section('title')
Scrumreal - Team management
@stop
@section('content')
@include('modal/team_add')
@include('modal/team_edit')
@include('modal/user_add', $role)
<div class="container-fluid">
  <div class="row-fluid">
    <div class="span8">
      <div class="box box-color box-bordered blue team-list">
        <div class="box-title">
          <h3>
            <i class="icon-group"></i>
            List team
          </h3>
          <div class="actions">
            <a href="#modal-add-team" data-backdrop="static" data-keyboard="false" id="btn-add-team" role="button" class="btn btn-primary mr10" data-toggle="modal"><i class="icon-plus"></i> Add team</a>
          </div>
        </div>
        <div class="box-content scrollable" data-height="520">
          @foreach($team_list as $team)
          <div class="span12 team" id="{{{$team->tid}}}">
            <div class="box box-color teal box-small box-bordered">
              <div class="box-title">
                <h3>
                  <i class="glyphicon-group"></i>
                  <span class="team-name">{{{$team->name}}}</span>
                </h3>
                <div class="actions">
                </div>
              </div>
              <div class="box-content">
                <div class="team-members">
                </div>
              </div>
            </div>
          </div>
          @endforeach
          <div class="team-temp">
            <div class="span12 team" id="">
              <div class="box box-color teal box-small box-bordered">
                <div class="box-title">
                  <h3>
                    <i class="glyphicon-group"></i>
                    <span class="team-name"></span>
                  </h3>
                  <div class="actions">
                  </div>
                </div>
                <div class="box-content">
                  <div class="team-members">
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="span4">
      <div class="box box-color box-bordered blue people-list">
        <div class="box-title">
          <h3>
            <i class="glyphicon-user"></i>
            List staffs
          </h3>
          <div class="actions">
            <a href="#modal-add-user" data-backdrop="static" data-keyboard="false" id="btn-add-user" role="button" class="btn btn-primary mr10" data-toggle="modal"><i class="glyphicon-user_add"></i> Add memebers</a>
          </div>
        </div>
        <div class="box-content scrollable" data-height="520">
          @foreach($free_user as $user)
          <div class="person" data-value="{{{$user->uid}}}">
            <img alt="" src="<?php echo 'data/image/user/' . $user->image ?>">
            <p class="person-name">{{{$user->fullname}}}</p>
          </div>
          @endforeach
        </div>
      </div>
    </div>
  </div>
  <script src="{{ asset("js/people.js" ) }}"></script>
</div>
@stop