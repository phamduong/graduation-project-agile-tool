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
            <a href="#modal-add-team" data-backdrop="static" data-keyboard="true" id="btn-add-team" role="button" class="btn btn-primary mr10" data-toggle="modal"><i class="icon-plus"></i> Add team</a>
          </div>
        </div>
        <div class="box-content scrollable" data-height="520">
          <div class='alert_block'></div>
          @foreach($team_list as $team)
          <div class="span12 team" id="<?php echo 'team_' . $team->tid; ?>" data-tid="{{{$team->tid}}}">
            <div class="box box-color teal box-small box-bordered">
              <div class="box-title">
                <h3>
                  <i class="glyphicon-group"></i>
                  <a href="{{{$team->tid}}}" class="team-name">{{{$team->name}}}</a>
                </h3>
                <div class="actions">
                </div>
              </div>
              <div class="box-content">
                <div class="team-members">
                  <div data-name="{{{$team->master_name}}}" data-value="{{{$team->master_id}}}" class="leader ui-draggable">
                    <img src="<?php echo 'data/image/user/' . $team->master_image; ?>" alt="">
                    <p class="person-name">{{{$team->master_name}}}</p>
                  </div>
                  @foreach($team_members[$team->tid] as $mem)
                  <div data-uid="{{{$mem->uid}}}"  data-name="{{{$mem->fullname}}}" id="<?php echo "member_" . $mem->uid ?>" class="person ui-draggable">
                    <img src="<?php echo 'data/image/user/' . $mem->image; ?>" alt="">
                    <p class="person-name">{{{$mem->fullname}}}</p>
                  </div>
                  @endforeach
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
      <div id="staff-list" class="box box-color box-bordered blue people-list">
        <div class="box-title">
          <h3>
            <i class="glyphicon-user"></i>
            List staffs
          </h3>
          <div class="actions">
            <a href="#modal-add-user" data-backdrop="static" data-keyboard="true" id="btn-add-user" role="button" class="btn btn-primary mr10" data-toggle="modal"><i class="glyphicon-user_add"></i> Add memebers</a>
          </div>
        </div>
        <div class="box-content scrollable" data-height="520">
          @foreach($free_user as $user)
          <div id="<?php echo "member_" . $user->uid ?>" class="person" data-uid="{{{$user->uid}}}" data-name="{{{$user->fullname}}}">
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