@extends('layouts.default_layout')
@section('title')
Scrumreal - Sprint management
@stop
@section('content')
@include('modal/sprint_add')
@include('modal/sprint_edit')
@include('modal/story_add')
@include('modal/story_edit')
@include('modal/task_add')
@include('modal/team_edit_day')
@include('modal/task_edit')
<div class="container-fluid">
  <div class="row-fluid">
    <div class="span9">
      <div class="box box-color box-bordered sprint-list">
        <div class="box-title">
          <h3>
            <i class="glyphicon-folder_open"></i>
            Sprint
          </h3>
          <div class="actions">
            <a href="#modal-add-sprint" data-backdrop="static" id="btn-add-sprint" role="button" class="btn btn-primary mr10" data-toggle="modal"><i class="icon-plus"></i> Add sprint</a>
          </div>
        </div>
        <div class="box-content scrollable" data-height="520" id="sprint-team-list">
          @foreach($sprint_list as $sprint)
          <div class="sprint" id="<?php echo 'sprint_' . $sprint->spid; ?>">
            <div class="box box-color box-small box-bordered">
              <div class="box-title">
                <h3>
                  <a href="{{{$sprint->spid}}}" class="sprint-name"><i class="glyphicon-folder_flag"></i>
                    {{{$sprint->name . ' ('. $sprint->start_date_es . ' - ' . $sprint->end_date_es  .') '}}}</a>
                </h3>
                <div class="actions">
                  @if($sprint->status == SPRINT_STATUS_IN_PLAN)
                  @if($has_sprint_running == false)
                  <button class="btn btn-darkblue btn-start-sprint" data-spid="{{{$sprint->spid}}}" aria-hidden="true">Start sprint</button>
                  @else  
                  <button style="display: none;" class="btn btn-darkblue btn-start-sprint" data-spid="{{{$sprint->spid}}}" aria-hidden="true">Start sprint</button>
                  @endif
                  <button style="display: none;" class="btn btn-darkblue btn-complete-sprint" data-spid="{{{$sprint->spid}}}" aria-hidden="true">Complete sprint</button>
                  <button style="display: none;" class="btn btn-darkblue btn-resume-sprint" data-spid="{{{$sprint->spid}}}" aria-hidden="true">Resume sprint</button>
                  <div class="sprint-status badge badge-warning">Planning</div>
                  @elseif ($sprint->status == SPRINT_STATUS_IN_PROGRESS)
                  <button style="display: none;" class="btn btn-darkblue btn-start-sprint" data-spid="{{{$sprint->spid}}}" aria-hidden="true">Start sprint</button>
                  <button class="btn btn-darkblue btn-complete-sprint" data-spid="{{{$sprint->spid}}}" aria-hidden="true">Complete sprint</button>
                  <button style="display: none;" class="btn btn-darkblue btn-resume-sprint" data-spid="{{{$sprint->spid}}}" aria-hidden="true">Resume sprint</button>
                  <div class="sprint-status badge badge-warning">In progress</div>
                  @elseif ($sprint->status == SPRINT_STATUS_COMPLETED)
                  <button style="display: none;" class="btn btn-darkblue btn-start-sprint" data-spid="{{{$sprint->spid}}}" aria-hidden="true">Start sprint</button>
                  <button style="display: none;" class="btn btn-darkblue btn-complete-sprint" data-spid="{{{$sprint->spid}}}" aria-hidden="true">Complete sprint</button>
                  @if($has_sprint_running == false)
                  <button class="btn btn-darkblue btn-resume-sprint" data-spid="{{{$sprint->spid}}}" aria-hidden="true">Resume sprint</button>
                  @else
                  <button style="display: none;" class="btn btn-darkblue btn-resume-sprint" data-spid="{{{$sprint->spid}}}" aria-hidden="true">Resume sprint</button>
                  @endif
                  <div class="sprint-status badge badge-warning">
                    Completed
                  </div>
                  @endif
                </div>
              </div>
              <div class="box-content">
                @if($sprint->status == SPRINT_STATUS_COMPLETED)
                <div class="sprint-teams-disabled" data-spid="{{{$sprint->spid}}}">
                  @else
                  <div class="sprint-teams" data-spid="{{{$sprint->spid}}}">
                    @endif
                    @foreach($team_list as $team)
                    <div class="s-team" id="<?php echo 's_team_' . $team->tid; ?>" data-tid="{{{$team->tid}}}" data-num-day="">
                      <div class="s-team-name">
                        {{{$team->name}}}
                        <span class="s-team-status"></span>
                      </div>
                      <!--<div class="s-team-story">-->
                      @foreach($story_list[$sprint->spid][$team->tid] as $story)
                      <div id="<?php echo 'story_' . $story->sid; ?>" data-sid="{{{$story->sid}}}" class="story story-addable" data-name="{{{$story->name}}}" data-order="{{{$story->order}}}" data-time-estimate="{{{$story->time_estimate}}}">
                        <div class="story-name"><a href="{{{$story->sid}}}" class="edit-story">{{{$story->name}}}</a></div>
                        <div class="story-points badge badge-info">{{{$story->point}}} point(s)</div>
                        <div class="story-status badge badge-info">{{{$story_status_name[$story->status]}}}</div>
                        <div class="story-time_estimate badge badge-info">{{{$story->time_estimate}}} day(s)</div>
                      </div>
                      @endforeach
                      <!--</div>-->
                    </div>
                    @endforeach
                  </div>
                </div>
              </div>
            </div>
            @endforeach
          </div>
        </div>
      </div>
      <div class="span3">
        <div class="box box-color box-bordered sprint-story-list" id="story-not-se-list">
          <div class="box-title">
            <h3>
              <i class="glyphicon-notes"></i>
              Stories
            </h3>
            <div class="actions">
              <a href="#modal-add-story" data-backdrop="static" id="btn-add-story" role="button" class="btn btn-primary mr10" data-toggle="modal"><i class="icon-plus"></i> Add story</a>
            </div>
          </div>
          <div class="box-content scrollable" data-height="520">
            @foreach($story_not_asign as $story)
            @if($story->time_estimate == null)
            <div id="<?php echo 'story_' . $story->sid; ?>" data-sid="{{{$story->sid}}}" class="story story-unaddable" data-name="{{{$story->name}}}" data-time-estimate="{{{$story->time_estimate}}}" data-order="">
              @else
              <div id="<?php echo 'story_' . $story->sid; ?>" data-sid="{{{$story->sid}}}" class="story story-addable" data-name="{{{$story->name}}}" data-time-estimate="{{{$story->time_estimate}}}" data-order="">
                @endif
                <div class="story-name"><a href="{{{$story->sid}}}" class="edit-story">{{{$story->name}}}</a></div>
                <div class="story-points badge badge-info">{{{$story->point}}} point(s)</div>
                <div class="story-status badge badge-info">{{{$story_status_name[$story->status]}}}</div>
                <div class="story-time_estimate badge badge-info">{{{$story->time_estimate}}} day(s)</div>
              </div>
              @endforeach
            </div>
          </div>
        </div>
        <script src="{{ asset("js/sprint.js" ) }}"></script>
      </div>    
    </div>
  </div>
  <!-- dataTables -->
  <script src="{{ asset("js/plugins/datatable/jquery.dataTables.min.js") }}"></script>
  <script src="{{ asset("js/plugins/datatable/TableTools.min.js") }}"></script>
  <script src="{{ asset("js/plugins/datatable/fnReloadAjax.js") }}"></script>
  <!--<script src="//cdn.datatables.net/tabletools/2.2.1/js/dataTables.tableTools.min.js"></script>-->
  <script src="{{ asset("js/plugins/datatable/ColReorderWithResize.js") }}"></script>
  <script src="{{ asset("js/plugins/datatable/ColVis.min.js") }}"></script>
  <script src="{{ asset("js/plugins/datatable/jquery.dataTables.columnFilter.js") }}"></script>
  <script src="{{ asset("js/plugins/datatable/jquery.dataTables.grouping.js") }}"></script>
</div>
@stop