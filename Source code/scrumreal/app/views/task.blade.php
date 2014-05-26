@extends('layouts.default_layout')
@section('title')
Scrumreal - Sprint management
@stop
@section('content')
@include('modal/task_add')
@include('modal/task_edit')
<div class="container-fluid">
  <div class="row-fluid">
    <table id="task-board">
        <!-- <caption>table title and/or explanatory text</caption> -->
      <thead>
        <tr>
          <th class="span2"><h4>User stories</h4></th>
      <th class="span2-5"><h4>To do</h4></th>
      <th class="span2-5"><h4>In progress</h4></th>
      <th class="span2-5"><h4>To test</h4></th>
      <th class="span2-5"><h4>Done</h4></th>
      </tr>
      </thead>
      <tbody>
        <tr>
          <td class="user-story" id="story1">
            <div class="span12 story-info">
              <div class="box box-color box-bordered red">
                <div class="box-title story-point">
                  <i class="icon-user"></i> 40 points
                </div>
                <div class="box-content story-content">
                  <div class="story-name">Lorem ipsum Eu minim non sint sit exercitation in cillum culpa sit elit culpa commodo.</div>
                  <div class="story-description">
                    <div class="team-do-story badge badge-info">Team 1</div>
                    <div class="story-days badge badge-info">100 days</div>
                    <div class="story-status badge badge-info">Ready for testtt</div>
                    <div class="progress progress-info story-progress">
                      <div class="bar" style="width: 81%">81%</div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </td>
          <td class="story-tasks">
            <div class="span10 task-box">
              <div class="box box-color box-bordered blue box-condensed task-box-content">
                <div class="box-title">
                </div>
                <div class="box-content">
                  <div class="row-fluid">
                    <div class="span8">
                      <span class="task-name">
                        <i class="icon-file"></i>
                        Story 2Lorem ipsum Eu minim non sint Story 2Lorem ipsum Eu
                      </span>
                    </div>
                    <div class="span4">
                      <img alt="" src="img/demo/user-1.jpg">
                      <p class="task-assign-name">Jane Doe</p>
                    </div>
                  </div>
                  <div class="row-fluid">
                    <span class="span3 badge badge-info">
                      100 d
                    </span>
                    <div class="span9 progress progress-info">
                      <div class="bar" style="width: 81%">81%</div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="box box-color box-bordered blue box-condensed task-box-content">
                <div class="box-title">
                </div>
                <div class="box-content">
                  <div class="row-fluid">
                    <div class="span8">
                      <span class="task-name">
                        <i class="icon-file"></i>
                        Story 2Lorem ipsum Eu minim non sint Story 2Lorem ipsum Eu
                      </span>
                    </div>
                    <div class="span4">
                      <img alt="" src="img/demo/user-1.jpg">
                      <p class="task-assign-name">Jane Doe</p>
                    </div>
                  </div>
                  <div class="row-fluid">
                    <span class="span3 badge badge-info">
                      100 d
                    </span>
                    <div class="span9 progress progress-info">
                      <div class="bar" style="width: 81%">81%</div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </td>
          <td class="story-tasks">
            <div class="span10 task-box">
              <div class="box box-color box-bordered blue box-condensed task-box-content">
                <div class="box-title">
                </div>
                <div class="box-content">
                  <div class="row-fluid">
                    <div class="span8">
                      <span class="task-name">
                        <i class="icon-file"></i>
                        Story 2Lorem ipsum Eu minim non sint Story 2Lorem ipsum Eu
                      </span>
                    </div>
                    <div class="span4">
                      <img alt="" src="img/demo/user-1.jpg">
                      <p class="task-assign-name">Jane Doe</p>
                    </div>
                  </div>
                  <div class="row-fluid">
                    <span class="span3 badge badge-info">
                      100 d
                    </span>
                    <div class="span9 progress progress-info">
                      <div class="bar" style="width: 81%">81%</div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </td>
          <td class="story-tasks">
            <div class="span10 task-box">
              <div class="box box-color box-bordered blue box-condensed task-box-content">
                <div class="box-title">
                </div>
                <div class="box-content">
                  <div class="row-fluid">
                    <div class="span8">
                      <span class="task-name">
                        <i class="icon-file"></i>
                        Story 2Lorem ipsum Eu minim non sint Story 2Lorem ipsum Eu minim non sint Story 2Lorem ipsum Eu minim non sint
                      </span>
                    </div>
                    <div class="span4">
                      <img alt="" src="img/demo/user-1.jpg">
                      <p class="task-assign-name">Jane Doe</p>
                    </div>
                  </div>
                  <div class="row-fluid">
                    <span class="span3 badge badge-info">
                      100 d
                    </span>
                    <div class="span9 progress progress-info">
                      <div class="bar" style="width: 81%">81%</div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </td>
          <td class="story-tasks">
            <div class="span10 task-box">
              <div class="box box-color box-bordered blue box-condensed task-box-content">
                <div class="box-title">
                </div>
                <div class="box-content">
                  <div class="row-fluid">
                    <div class="span8">
                      <span class="task-name">
                        <i class="icon-file"></i>
                        Story 2Lorem ipsum Eu minim non sint Story 2Lorem ipsum Eu minim non sint Story 2Lorem ipsum Eu minim non sint
                      </span>
                    </div>
                    <div class="span4">
                      <img alt="" src="img/demo/user-1.jpg">
                      <p class="task-assign-name">Jane Doe</p>
                    </div>
                  </div>
                  <div class="row-fluid">
                    <span class="span3 badge badge-info">
                      100 d
                    </span>
                    <div class="span9 progress progress-info">
                      <div class="bar" style="width: 81%">81%</div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td class="user-story" id="story2">
            <div class="span12 story-info">
              <div class="box box-color box-bordered orange">
                <div class="box-title story-point">
                  <i class="icon-user"></i> 40 points
                </div>
                <div class="box-content story-content">
                  <div class="story-name">Lorem ipsum Eu minim non sint sit exercitation in cillum culpa sit elit culpa commodo.</div>
                  <div class="story-description">
                    <div class="team-do-story badge badge-info">Team 1</div>
                    <div class="story-days badge badge-info">100 days</div>
                    <div class="story-status badge badge-info">Ready for testtt</div>
                    <div class="progress progress-info story-progress">
                      <div class="bar" style="width: 81%">81%</div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </td>
          <td class="story-tasks">
            <div class="span10 task-box">
              <div class="box box-color box-bordered blue box-condensed task-box-content">
                <div class="box-title">
                </div>
                <div class="box-content">
                  <div class="row-fluid">
                    <div class="span8">
                      <span class="task-name">
                        <i class="icon-file"></i>
                        Story 2Lorem ipsum Eu minim non sint Story 2Lorem ipsum Eu
                      </span>
                    </div>
                    <div class="span4">
                      <img alt="" src="img/demo/user-1.jpg">
                      <p class="task-assign-name">Jane Doe</p>
                    </div>
                  </div>
                  <div class="row-fluid">
                    <span class="span3 badge badge-info">
                      100 d
                    </span>
                    <div class="span9 progress progress-info">
                      <div class="bar" style="width: 81%">81%</div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="box box-color box-bordered blue box-condensed task-box-content">
                <div class="box-title">
                </div>
                <div class="box-content">
                  <div class="row-fluid">
                    <div class="span8">
                      <span class="task-name">
                        <i class="icon-file"></i>
                        Story 2Lorem ipsum Eu minim non sint Story 2Lorem ipsum Eu minim non sint Story 2Lorem ipsum Eu minim non sint
                      </span>
                    </div>
                    <div class="span4">
                      <img alt="" src="img/demo/user-1.jpg">
                      <p class="task-assign-name">Jane Doe</p>
                    </div>
                  </div>
                  <div class="row-fluid">
                    <span class="span3 badge badge-info">
                      100 d
                    </span>
                    <div class="span9 progress progress-info">
                      <div class="bar" style="width: 81%">81%</div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </td>
          <td class="story-tasks">
            <div class="span10 task-box">
              <div class="box box-color box-bordered blue box-condensed task-box-content">
                <div class="box-title">
                </div>
                <div class="box-content">
                  <div class="row-fluid">
                    <div class="span8">
                      <span class="task-name">
                        <i class="icon-file"></i>
                        Story 2Lorem ipsum Eu minim non sint Story 2Lorem ipsum Eu minim non sint Story 2Lorem ipsum Eu minim non sint
                      </span>
                    </div>
                    <div class="span4">
                      <img alt="" src="img/demo/user-1.jpg">
                      <p class="task-assign-name">Jane Doe</p>
                    </div>
                  </div>
                  <div class="row-fluid">
                    <span class="span3 badge badge-info">
                      100 d
                    </span>
                    <div class="span9 progress progress-info">
                      <div class="bar" style="width: 81%">81%</div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </td>
          <td class="story-tasks">
            <div class="span10 task-box">
              <div class="box box-color box-bordered blue box-condensed task-box-content">
                <div class="box-title">
                </div>
                <div class="box-content">
                  <div class="row-fluid">
                    <div class="span8">
                      <span class="task-name">
                        <i class="icon-file"></i>
                        Story 2Lorem ipsum Eu minim non sint Story 2Lorem ipsum Eu minim non sint Story 2Lorem ipsum Eu minim non sint
                      </span>
                    </div>
                    <div class="span4">
                      <img alt="" src="img/demo/user-1.jpg">
                      <p class="task-assign-name">Jane Doe</p>
                    </div>
                  </div>
                  <div class="row-fluid">
                    <span class="span3 badge badge-info">
                      100 d
                    </span>
                    <div class="span9 progress progress-info">
                      <div class="bar" style="width: 81%">81%</div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </td>
          <td class="story-tasks">
            <div class="span10 task-box">
              <div class="box box-color box-bordered blue box-condensed task-box-content">
                <div class="box-title">
                </div>
                <div class="box-content">
                  <div class="row-fluid">
                    <div class="span8">
                      <span class="task-name">
                        <i class="icon-file"></i>
                        Story 2Lorem ipsum Eu minim non sint Story 2Lorem ipsum Eu minim non sint Story 2Lorem ipsum Eu minim non sint
                      </span>
                    </div>
                    <div class="span4">
                      <img alt="" src="img/demo/user-1.jpg">
                      <p class="task-assign-name">Jane Doe</p>
                    </div>
                  </div>
                  <div class="row-fluid">
                    <span class="span3 badge badge-info">
                      100 d
                    </span>
                    <div class="span9 progress progress-info">
                      <div class="bar" style="width: 81%">81%</div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td class="user-story" id="story3">
            <div class="span12 story-info">
              <div class="box box-color box-bordered green">
                <div class="box-title story-point">
                  <i class="icon-user"></i> 40 points
                </div>
                <div class="box-content story-content">
                  <div class="story-name">Lorem ipsum Eu minim non sint sit exercitation in cillum culpa sit elit culpa commodo.</div>
                  <div class="story-description">
                    <div class="team-do-story badge badge-info">Team 1</div>
                    <div class="story-days badge badge-info">100 days</div>
                    <div class="story-status badge badge-info">Ready for testtt</div>
                    <div class="progress progress-info story-progress">
                      <div class="bar" style="width: 81%">81%</div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </td>
          <td class="story-tasks">
            <div class="span10 task-box">
              <div class="box box-color box-bordered blue box-condensed task-box-content">
                <div class="box-title">
                </div>
                <div class="box-content">
                  <div class="row-fluid">
                    <div class="span8">
                      <span class="task-name">
                        <i class="icon-file"></i>
                        Story 2Lorem ipsum Eu minim non sint Story 2Lorem ipsum Eu minim non sint Story 2Lorem ipsum Eu minim non sint
                      </span>
                    </div>
                    <div class="span4">
                      <img alt="" src="img/demo/user-1.jpg">
                      <p class="task-assign-name">Jane Doe</p>
                    </div>
                  </div>
                  <div class="row-fluid">
                    <span class="span3 badge badge-info">
                      100 d
                    </span>
                    <div class="span9 progress progress-info">
                      <div class="bar" style="width: 81%">81%</div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </td>
          <td class="story-tasks">
            <div class="span10 task-box">
            </div>
          </td>
          <td class="story-tasks">
            <div class="span10 task-box">
            </div>
          </td>
          <td class="story-tasks">
            <div class="span10 task-box">
            </div>
          </td>
        </tr>
        <tr>
          <td class="user-story" id="story4">
            <div class="span12 story-info">
              <div class="box box-color box-bordered lightgrey">
                <div class="box-title story-point">
                  <i class="icon-user"></i> 40 points
                </div>
                <div class="box-content story-content">
                  <div class="story-name">Lorem ipsum Eu minim non sint sit exercitation in cillum culpa sit elit culpa commodo.</div>
                  <div class="story-description">
                    <div class="team-do-story badge badge-info">Team 1</div>
                    <div class="story-days badge badge-info">100 days</div>
                    <div class="story-status badge badge-info">Ready for testtt</div>
                    <div class="progress progress-info story-progress">
                      <div class="bar" style="width: 81%">81%</div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
  <script src="js/task.js"></script>
</div>
@stop