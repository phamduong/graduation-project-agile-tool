@extends('layouts.login_layout')
@section('keylang')
<script>
</script>
@stop
@section('content')
<div class="wrapper">
  <h1><a href="#"><img src="img/logo-big.png" alt="" class='retina-ready' width="59" height="49">SCRUM REAL</a></h1>
  <div class="login-body">
    <h2>{{{Lang::get('layout.sign_in_title')}}}</h2>
    <form class='form-validate' id="frm_login">
      <div class='alert_block'></div>
      <div class="control-group">
        <div class="email controls">
          <input type="text" name='uname' placeholder="{{{Lang::get('layout.user_name_holder')}}}" class='input-block-level' data-rule-required="true" data-msg-required="{{{Lang::get('message.require_mes')}}}">
        </div>
      </div>
      <div class="control-group">
        <div class="pw controls">
          <input type="password" name="upw" placeholder="{{{Lang::get('layout.user_pw_holder')}}}" class='input-block-level' data-rule-required="true" data-msg-required="{{{Lang::get('message.require_mes')}}}">
        </div>
      </div>
      <div class="submit">
        <div class="remember">
        </div>
        <input type="submit" value="{{{Lang::get('layout.sign_in_submit')}}}" class='btn btn-primary'>
      </div>
    </form>
    <div class="forget">
      <a href="#"><span></span></a>
    </div>
  </div>
</div>
@stop