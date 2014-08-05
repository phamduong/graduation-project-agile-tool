@extends('layouts.default_layout')
@section('title')
{{{$current_proj_name}}}
@stop
@section('content')
@include('modal/task_edit')
<div class="container-fluid">
  <div class="row-fluid">
    <table id="task-board">
      <thead>
        <tr>
          <th class="span2"><h4>Product backlogs</h4></th>
          <th class="span2-5"><h4>To do</h4></th>
          <th class="span2-5"><h4>In progress</h4></th>
          <th class="span2-5"><h4>To test</h4></th>
          <th class="span2-5"><h4>Done</h4></th>
      </tr>
      </thead>
      <tbody>
        @if(isset($story_in_sprint))
        @foreach($story_in_sprint as $story)
        <tr class="user-story" id="<?php echo 'story_' . $story->sid; ?>" data-sid="{{{$story->sid}}}">
          <td class="story_info">
            <div class="span12 story-info">
              <div class="box box-color box-bordered">
                <div class="box-title story-point">
                  <i class="icon-user"></i> {{{$story->point}}} points
                </div>
                <div class="box-content story-content">
                  <div class="story-name"><a href="{{{$story->sid}}}" class="task_edit_story">{{{$story->story_name}}}</a></div>
                  <div class="story-description">
                    <div class="team-do-story badge badge-info">{{{$story->team_name}}}</div>
                    <div class="story-days badge badge-info">{{{$story->time_estimate}}} days</div>
                    @if($story->story_status === 1)
                    <div class="story-status badge badge-info">New</div>
                    @elseif($story->story_status === 2)
                    <div class="story-status badge badge-info">Approved</div>
                    @elseif($story->story_status === 3)
                    <div class="story-status badge badge-info">Estimated</div>
                    @elseif($story->story_status === 4)
                    <div class="story-status badge badge-info">Assigned</div>
                    @elseif($story->story_status === 5)
                    <div class="story-status badge badge-info">To do</div>
                    @elseif($story->story_status === 6)
                    <div class="story-status badge badge-info">In progress</div>
                    @elseif($story->story_status === 7)
                    <div class="story-status badge badge-info">To test</div>
                    @elseif($story->story_status === 8)
                    <div class="story-status badge badge-info">Done</div>
                    @elseif($story->story_status === 9)
                    <div class="story-status badge badge-info">Sprint completed</div>
                    @endif
                    <div class="progress progress-info story-progress">
                      <div class="bar" style="width: {{{$story->progress . '%'}}}">{{{$story->progress . '%'}}}</div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </td>
          @if(count($story->task_in_story) != 0)
          <td class="story-tasks to-do-tasks">
            <div class="span10 task-box" data-task-status="1">
              @foreach($story->task_in_story as $task)
              @if($task->status === 1)
              @if($task->user_image != "")
              <div class="box box-color box-bordered blue box-condensed task-item task-ta" data-taid="{{{$task->taid}}}" id="{{{'task_'. $task->taid}}}" data-current-sid="{{{$story->sid}}}" data-order="{{{$task->order}}}">
              @else
              <div class="box box-color box-bordered blue box-condensed task-item-unsortabled task-ta" data-taid="{{{$task->taid}}}" id="{{{'task_'. $task->taid}}}" data-current-sid="{{{$story->sid}}}" data-order="{{{$task->order}}}">
              @endif
                <div class="box-title">
                </div>
                <div class="box-content">
                  <div class="row-fluid">
                    <div class="span8">
                      <span class="task-name">
                        <i class="icon-file"></i>
                        <a href="{{{$task->taid}}}" class="task_edit_task">{{{$task->name}}}</a>
                      </span>
                    </div>
                    <div class="span4">
                      @if($task->user_image != "")
                      <img alt="" class="taskboard-user-image" src="<?php echo asset('data/image/user/' . $task->user_image); ?>">
                      @endif
                      @if($task->user_name != "")
                      <p class="task-assign-name">{{{$task->user_name}}}</p>
                      @endif
                    </div>
                  </div>
                  <div class="row-fluid">
                    <span class="span3 badge badge-info">
                      {{{$task->time_estimate}}} d
                    </span>
                    <div class="span9 progress progress-info">
                      <div class="bar" style="width: {{{$task->progress . '%'}}}">{{{$task->progress . '%'}}}</div>
                    </div>
                  </div>
                </div>
              </div>
              @endif
              @endforeach
            </div>
          </td>
          <td class="story-tasks in-progress-tasks">
            <div class="span10 task-box" data-task-status="2">
              @foreach($story->task_in_story as $task)
              @if($task->status === 2)
              @if($task->user_image != "")
              <div class="box box-color box-bordered blue box-condensed task-item task-ta" data-taid="{{{$task->taid}}}" id="{{{'task_'. $task->taid}}}" data-current-sid="{{{$story->sid}}}" data-order="{{{$task->order}}}">
              @else
              <div class="box box-color box-bordered blue box-condensed task-item-unsortabled task-ta" data-taid="{{{$task->taid}}}" id="{{{'task_'. $task->taid}}}" data-current-sid="{{{$story->sid}}}" data-order="{{{$task->order}}}">
              @endif
                <div class="box-title">
                </div>
                <div class="box-content">
                  <div class="row-fluid">
                    <div class="span8">
                      <span class="task-name">
                        <i class="icon-file"></i>
                        <a href="{{{$task->taid}}}" class="task_edit_task">{{{$task->name}}}</a>
                      </span>
                    </div>
                    <div class="span4">
                      @if($task->user_image != "")
                      <img alt="" class="taskboard-user-image" src="<?php echo asset('data/image/user/' . $task->user_image); ?>">
                      @endif
                      @if($task->user_name != "")
                      <p class="task-assign-name">{{{$task->user_name}}}</p>
                      @endif
                    </div>
                  </div>
                  <div class="row-fluid">
                    <span class="span3 badge badge-info">
                      {{{$task->time_estimate}}} d
                    </span>
                    <div class="span9 progress progress-info">
                      <div class="bar" style="width: {{{$task->progress . '%'}}}">{{{$task->progress . '%'}}}</div>
                    </div>
                  </div>
                </div>
              </div>
              @endif
              @endforeach
            </div>
          </td>
          <td class="story-tasks to-test-tasks">
            <div class="span10 task-box" data-task-status="3">
              @foreach($story->task_in_story as $task)
              @if($task->status === 3)
              @if($task->user_image != "")
              <div class="box box-color box-bordered blue box-condensed task-item task-ta" data-taid="{{{$task->taid}}}" id="{{{'task_'. $task->taid}}}" data-current-sid="{{{$story->sid}}}" data-order="{{{$task->order}}}">
              @else
              <div class="box box-color box-bordered blue box-condensed task-item-unsortabled task-ta" data-taid="{{{$task->taid}}}" id="{{{'task_'. $task->taid}}}" data-current-sid="{{{$story->sid}}}" data-order="{{{$task->order}}}">
              @endif
                <div class="box-title">
                </div>
                <div class="box-content">
                  <div class="row-fluid">
                    <div class="span8">
                      <span class="task-name">
                        <i class="icon-file"></i>
                        <a href="{{{$task->taid}}}" class="task_edit_task">{{{$task->name}}}</a>
                      </span>
                    </div>
                    <div class="span4">
                      @if($task->user_image != "")
                      <img alt="" class="taskboard-user-image" src="<?php echo asset('data/image/user/' . $task->user_image); ?>">
                      @endif
                      @if($task->user_name != "")
                      <p class="task-assign-name">{{{$task->user_name}}}</p>
                      @endif
                    </div>
                  </div>
                  <div class="row-fluid">
                    <span class="span3 badge badge-info">
                      {{{$task->time_estimate}}} d
                    </span>
                    <div class="span9 progress progress-info">
                      <div class="bar" style="width: {{{$task->progress . '%'}}}">{{{$task->progress . '%'}}}</div>
                    </div>
                  </div>
                </div>
              </div>
              @endif
              @endforeach
            </div>
          </td>
          <td class="story-tasks done-tasks">
            <div class="span10 task-box" data-task-status="4">
              @foreach($story->task_in_story as $task)
              @if($task->status === 4)
              @if($task->user_image != "")
              <div class="box box-color box-bordered blue box-condensed task-item task-ta" data-taid="{{{$task->taid}}}" id="{{{'task_'. $task->taid}}}" data-current-sid="{{{$story->sid}}}" data-order="{{{$task->order}}}">
              @else
              <div class="box box-color box-bordered blue box-condensed task-item-unsortabled task-ta" data-taid="{{{$task->taid}}}" id="{{{'task_'. $task->taid}}}" data-current-sid="{{{$story->sid}}}" data-order="{{{$task->order}}}">
              @endif
                <div class="box-title">
                </div>
                <div class="box-content">
                  <div class="row-fluid">
                    <div class="span8">
                      <span class="task-name">
                        <i class="icon-file"></i>
                        <a href="{{{$task->taid}}}" class="task_edit_task">{{{$task->name}}}</a>
                      </span>
                    </div>
                    <div class="span4">
                      @if($task->user_image != "")
                      <img alt="" class="taskboard-user-image" src="<?php echo asset('data/image/user/' . $task->user_image); ?>">
                      @endif
                      @if($task->user_name != "")
                      <p class="task-assign-name">{{{$task->user_name}}}</p>
                      @endif
                    </div>
                  </div>
                  <div class="row-fluid">
                    <span class="span3 badge badge-info">
                      {{{$task->time_estimate}}} d
                    </span>
                    <div class="span9 progress progress-info">
                      <div class="bar" style="width: {{{$task->progress . '%'}}}">{{{$task->progress . '%'}}}</div>
                    </div>
                  </div>
                </div>
              </div>
              @endif
              @endforeach
            </div>
          </td>
          @endif
        </tr>
        @endforeach
        @endif
      </tbody>
    </table>
  </div>

  <div class="task-temp" style="display: none">
    <div class="box box-color box-bordered blue box-condensed task-item-unsortabled task-ta" data-taid="" id="task_" data-current-sid="" data-order="">
      <div class="box-title">
      </div>
      <div class="box-content">
        <div class="row-fluid">
          <div class="span8">
            <span class="task-name">
              <i class="icon-file"></i>
              <a href="" class="task_edit_task"></a>
            </span>
          </div>
          <div class="span4">
            
          </div>
        </div>
        <div class="row-fluid">
          <span class="span3 badge badge-info"> d
          </span>
          <div class="span9 progress progress-info">
            <div class="bar" style="width: 50%"></div>
          </div>
        </div>
      </div>
    </div>
  </div>
        
  <script src="{{asset("js/task.js")}}"></script>
  <script>
    @if(isset($current_project))
      var current_project = {{{$current_project}}};
    @endif
  </script>
</div>
@stop