@extends('layouts.default_layout')
@section('title')
Scrumreal - User profile
@stop
@section('content')
<div class="container-fluid">
  <div class="row-fluid">
    <div class="span12">
      <div class="box box-color box-bordered">
        <div class="box-title">
          <h3>
            <i class="icon-user"></i>
            {{{Lang::get('layout.edit_user')}}}
          </h3>
        </div>
        <div class="box-content nopadding">
          <ul class="tabs tabs-inline tabs-top">
            <li class='{{{$profile_cls}}}'>
              <a href="#profile" data-toggle='tab'><i class="icon-user"></i> {{{Lang::get('layout.edit_profile')}}}</a>
            </li>
            <li class='{{{$user_settings_cls}}}'>
              <a href="#user-settings" data-toggle='tab'><i class="glyphicon-settings"></i> {{{Lang::get('layout.settings')}}}</a>
            </li>
            <li class=''>
              <a href="#change-password" data-toggle='tab'><i class="glyphicon-settings"></i> {{{Lang::get('layout.change_password')}}}</a>
            </li>
          </ul>
          <div class="tab-content padding tab-content-inline tab-content-bottom">
            <div class='alert_block'></div>
            <div class="tab-pane {{{$profile_cls}}}" id="profile">
              <form class="form-horizontal form-validate" id="frm-user-general">
                <div class="row-fluid">
                  <div class="span2">
                    <div class="fileupload fileupload-new" data-provides="fileupload">
                      <div class="fileupload-new thumbnail" style="max-width: 150px; max-height: 150px;"><img src="<?php echo asset('data/image/user/' . $data['image']); ?>" /></div>
                      <div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 150px; max-height: 150px; line-height: 20px;"></div>
                      <div>
                        <span class="btn btn-file"><span class="fileupload-new">Select image</span><span class="fileupload-exists">Change</span><input type="file" id="uimage" name="uimage" data-current="{{{$data['image']}}}"/></span>
                        <a href="#" class="btn fileupload-exists" data-dismiss="fileupload">Remove</a>
                      </div>
                    </div>
                  </div>
                  <div class="span10">
                    <div class="control-group">
                      <label for="fullname" class="control-label right">Name:</label>
                      <div class="controls">
                        <input type="text" name="fullname" id="fullname" class='input-xlarge' value="{{{$data['fullname']}}}" data-rule-required="true" data-current="{{{$data['fullname']}}}">
                      </div>
                    </div>
                    <div class="control-group">
                      <label for="birthday" class="control-label right">Birthday</label>
                      <div class="controls">
                        <input type="text" placeholder="Pick user's birthday" value="{{{$data['birthday']}}}" data-current="{{{$data['birthday']}}}" name="birthday" id="birthday" id="user-birthday" class="input-xlarge datepick" data-msg-required="Please pick user's birthday" data-rule-required="true">
                      </div>
                    </div>
                    <div class="control-group">
                      <label for="country" class="control-label right">Country:</label>
                      <div class="controls">
                        <select name="country" id="country" class="select2-me input-xlarge" data-current="{{{$data['country']}}}">
                          <?php
                          $con = $data['country'];
                          ?>
                          @foreach ($country as $key => $value)
                          @if($key == $con)
                          <option value="{{{$key}}}" selected="selected">{{{$value}}}</option>
                          @else
                          <option value="{{{$key}}}">{{{$value}}}</option>
                          @endif
                          @endforeach
                        </select>
                      </div>
                    </div>
                    <div class="form-actions">
                      <input type="submit" class='btn btn-primary' value="Save">
                      <span class="loader"><img src="{{asset("img/loading.gif")}}" /></span>
                    </div>
                  </div>
                </div>
              </form>
            </div>
            <div class="tab-pane {{{$user_settings_cls}}}" id="user-settings">
              <form action="#" class="form-horizontal form-validate">
                <div class="control-group">
                </div>
                <div class="form-actions">
                  <input type="submit" class='btn btn-primary' value="Save settings">
                  <span class="loader"><img src="{{asset("img/loading.gif")}}" /></span>
                </div>
              </form>
            </div>
            <div class="tab-pane" id="change-password">
              <form action="#" class="form-horizontal form-validate" id="change_pass" autocomplete="off">
                <div class="row-fluid">
                  <div class="span10">
                    <div class="control-group">
                      <label for="current_pw" class="control-label right">Current password</label>
                      <div class="controls">
                        <input type="password" name="current_pw" id="current_pw" class="input-xlarge" data-rule-required="true">
                      </div>
                    </div>
                    <div class="control-group">
                      <label for="new_pw" class="control-label right">New password</label>
                      <div class="controls">
                        <input type="password" name="new_pw" id="new_pw" class="input-xlarge" data-rule-required="true">
                      </div>
                    </div>
                    <div class="control-group">
                      <label for="confirm_pw" class="control-label right">Confirm password</label>
                      <div class="controls">
                        <input type="password" name="confirm_pw" id="confirm_pw" class="input-xlarge" data-rule-equalTo="#new_pw" data-rule-required="true">
                      </div>
                    </div>
                    <div class="form-actions">
                      <input type="submit" class='btn btn-primary' value="Change password">
                      <span class="loader"><img src="{{asset("img/loading.gif")}}" /></span>
                    </div>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script src="{{ asset("js/profile.js" ) }}"></script>
</div>
@stop