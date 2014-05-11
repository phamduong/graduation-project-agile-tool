@extends('layouts.default_layout')
@section('content')
<div class="container-fluid">
  <div class="row-fluid">
    {{{
      $data = Controller::call('LanguageController@index')
      print_r($lang);
    }}}}
  </div>
</div>
@stop