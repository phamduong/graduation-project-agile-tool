<div class="container-fluid">
  <a href="#" id="brand">CONNECT</a>
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
    <li id="report">
      <a href="/report">
        <span>{{{Lang::get('layout.report')}}}</span>
      </a>
    </li>
  </ul>
  <span class="global-loading"><img src="{{asset("img/global_loading.gif")}}" /></span>
  <div class="user">
    <ul class="icon-nav">
      <li class='dropdown'>
        <a href="#" class='dropdown-toggle' data-toggle="dropdown"><i class="icon-envelope"></i><span class="label label-lightred">4</span></a>
        <ul class="dropdown-menu pull-right message-ul">
          <li>
            <a href="#">
              <img src="{{asset("img/demo/user-1.jpg")}}" alt="">
              <div class="details">
                <div class="name">Jane Doe</div>
                <div class="message">
                  Lorem ipsum Commodo quis nisi ...
                </div>
              </div>
            </a>
          </li>
          <li>
            <a href="#">
              <img src="{{asset("img/demo/user-2.jpg")}}" alt="">
              <div class="details">
                <div class="name">John Doedoe</div>
                <div class="message">
                  Ut ad laboris est anim ut ...
                </div>
              </div>
              <div class="count">
                <i class="icon-comment"></i>
                <span>3</span>
              </div>
            </a>
          </li>
          <li>
            <a href="#">
              <img src="{{asset("img/demo/user-3.jpg")}}" alt="">
              <div class="details">
                <div class="name">Bob Doe</div>
                <div class="message">
                  Excepteur Duis magna dolor!
                </div>
              </div>
            </a>
          </li>
          <li>
            <a href="components-messages.html" class='more-messages'>Go to Message center <i class="icon-arrow-right"></i></a>
          </li>
        </ul>
      </li>
      <li class='dropdown language-select'>
        <a href="#" class='dropdown-toggle' data-toggle="dropdown"><img src="<?php echo asset('img/demo/flags/' . $lang['current']['lang_icon']); ?>" alt=""><span>{{{strtoupper($lang['current']['lang_cd'])}}}</span></a>
        <ul class="dropdown-menu pull-right">
          @foreach($lang['lang_list'] as $lg)
          <li>
            <a href="{{{route('language.select', $lg['lang_cd'])}}}" class="lang-select"><img src="<?php echo asset('img/demo/flags/' . $lg['lang_icon']); ?>" alt=""><span>{{{$lg['lang_text']}}}</span></a>
          </li>
          @endforeach
        </ul>
      </li>
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
