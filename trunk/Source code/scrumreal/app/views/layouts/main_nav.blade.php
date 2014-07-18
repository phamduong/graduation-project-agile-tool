<div class="container-fluid">
  <a href="#" id="brand">Scrumtool</a>
  <a href="#" class="toggle-nav" rel="tooltip" data-placement="bottom" title="Toggle navigation"><i class="icon-reorder"></i></a>
  <ul class='main-nav'>
    <li id="project">
      <a href="/project">
        <span>{{{Lang::get('layout.project')}}}</span>
      </a>
    </li>
    <li id="story">
      <a href="/story">
        <span>{{{Lang::get('layout.user_story')}}}</span>
      </a>
    </li>
    <li id="people">
      <a href="/people">
        <span>{{{Lang::get('layout.people')}}}</span>
      </a>
    </li>
    <li id="sprint">
      <a href="/sprint">
        <span>{{{Lang::get('layout.sprint')}}}</span>
      </a>
    </li>
    <li id="taskboard">
      <a href="/taskboard">
        <span>{{{Lang::get('layout.taskboard')}}}</span>
      </a>
    </li>
    <li id="burndown">
      <a href="/burndown">
        <span>Burn down</span>
      </a>
    </li>
    <li id="burnup">
      <a href="/burnup">
        <span>Burn up</span>
      </a>
    </li>
  </ul>
  <span class="global-loading"><img src="{{asset("img/global_loading.gif")}}" /></span>
  <div class="user">
    <ul class="icon-nav">
    </ul>
    <div class="dropdown">
      <a href="#" class='dropdown-toggle' data-toggle="dropdown">{{{$cur_user['name']}}} <img src="<?php echo asset('data/image/user/' . $cur_user['image']); ?>" class="uimage-small" alt=""></a>
      <ul class="dropdown-menu pull-right">
        <li>
          <a href="/user-profile">{{{Lang::get('layout.edit_profile')}}}</a>
        </li>
        <li>
          <a href="/user-settings">{{{Lang::get('layout.account_settings')}}}</a>
        </li>
        <li>
          <a href="/permission">Permission</a>
        </li>
        <li>
          <a href="/logout">{{{Lang::get('layout.sign_out')}}}</a>
        </li>
      </ul>
    </div>
  </div>
  <script>
    @if (isset($active_nav))
            var active_nav = "{{{$active_nav}}}";
    $("#" + active_nav).addClass('active');
            @endif
  </script>
</div>
