<div id="modal-edit-story" class="modal modal-custom hide fade box box-color lime modal-with-tab" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="box-title">
      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
      <h3 id="myModalLabel"><i class="icon-edit"></i>Edit Story</h3>
      <ul class="tabs">
        <li class="active">
          <a href="#tab-story-info-edit" data-toggle="tab">Story infomations</a>
        </li>
        <li>
          <a href="#tab-task" data-toggle="tab">Tasks</a>
        </li>
        <li>
          <a href="#tab-story-comment" data-toggle="tab">Comment</a>
        </li>
        <li>
          <a href="#tab-story-activity" data-toggle="tab">Activity</a>
        </li>
      </ul>
    </div>
    <div class="box-content">
      <div class="tab-content row-fluid">
        <div class="alert_block"></div>
        <div class="tab-pane active" id="tab-story-info-edit">
          <form action="#" method="POST" class='form-horizontal form-validate' id="form-edit-story" autocomplete="off">
            <div class="box-content row-fluid">
              <div class="modal-body">
                <input type="hidden" id="sid" name="sid" value="" />
                <div class="control-group">
                  <label for="name" class="control-label">Story name <small>Require</small></label>
                  <div class="controls">
                    <input type="text" placeholder="Input story name here" name="name" id="name" class="span8" data-rule-required="true">
                  </div>
                </div>
                <div class="control-group">
                  <label for="priority" class="control-label">Priority <small>Require</small></label>
                  <div class="controls">
                    <select name="priority" id="priority" data-rule-required="true" class="span8">
                      <option value=""></option>
                      <option value="1">Urgent</option>
                      <option value="2">High</option>
                      <option value="3">Medium</option>
                      <option value="4">Low</option>
                    </select>
                  </div>
                </div>
                <div class="control-group">
                  <label for="status" class="control-label">Status</label>
                  <div class="controls">
                    <select id="status" data-rule-required="true" class="span8" disabled="disabled">
                      <option value=""></option>
                      <option value="1">New</option>
                      <option value="2">Approved</option>
                      <option value="3">Estimated</option>
                      <option value="4">Assigned to sprint</option>
                      <option value="5">To do</option>
                      <option value="6">In progress</option>
                      <option value="7">To test</option>
                      <option value="8">Done</option>
                      <option value="9">Sprint completed</option>
                    </select>
                  </div>
                </div>
                <div class="control-group">
                  <label for="time_estimate" class="control-label">Estimate time <small>Day(s)</small></label>
                  <div class="controls">
                    <input type="text" placeholder="Input time estimate here" name="time_estimate" data-rule-number="true" id="time_estimate" class="span8" data-rule-required="true" >
                  </div>
                </div>
                <div class="control-group">
                  <label for="create_user" class="control-label">Create user</label>
                  <div class="controls">
                    <input type="text" placeholder="Create user" name="create_user" id="create_user" class="span8" disabled="disabled">
                  </div>
                </div>
                <div class="control-group">
                  <label for="point" class="control-label">Points <small>Points</small></label>
                  <div class="controls">
                    <input type="text" placeholder="Story points" name="point" id="point" class="span8" data-rule-number="true" data-rule-required="true" >
                  </div>
                </div>
                <div class="control-group">
                  <label for="demo" class="control-label">How to demo <small>Require</small></label>
                  <div class="controls">
                    <textarea name="demo" id="demo" class="input-block-level span11" placeholder="Describe how to demo story" data-rule-required="true" ></textarea>
                  </div>
                </div>
                <div class="control-group">
                  <label for="description" class="control-label">Description <small>Require</small></label>
                  <div class="controls">
                    <textarea name="description" id="description" class="input-block-level span11" placeholder="Describe story" data-rule-required="true" ></textarea>
                  </div>
                </div>
              </div>
            </div>
            <div class="modal-footer">
              <span class="loader"><img src="{{asset("img/loading.gif")}}" /></span>
              <input type="submit" class="btn btn-primary" value="Save story">
              <button class="btn btn-red approve-story" data-sid="" data-status="" aria-hidden="true">Approve</button>
              <button class="btn btn-red delete-story" data-sid="" data-status="" aria-hidden="true">Delete</button>
              <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
            </div>
          </form>
        </div>

        <div class="tab-pane" id="tab-task">
          <div class="modal-body">
            <table class="table table-hover table-nomargin table-bordered usertable" id="task-datatable">
              <thead>
                <tr class="thefilter">
                  <th>Task name</th>
                  <th>Time estimate</th>
                  <th>Status</th>
                  <th>Create time</th>
                  <th>Create user</th>
                  <th>Description</th>
                  <th>Assign to</th>
                  <th>Options</th>
                </tr>
                <tr>
                  <th>Task name</th>
                  <th>Time estimate</th>
                  <th></th>
                  <th>Create time</th>
                  <th>Create user</th>
                  <th>Description</th>
                  <th>Assign to</th>
                  <th>Options</th>
                </tr>
              </thead>
              <tbody>
              </tbody>
            </table>
          </div>
          <div class="modal-footer">
            <a href="#modal-add-task" data-backdrop="static" data-toggle="modal" role="button" class="btn btn-primary mr10" data-sid="" data-status="" aria-hidden="true">Add task</a>
          </div>
        </div>

        <div class="tab-pane tab-comment" id="tab-story-comment">
          <div class="modal-body">
            <input type="hidden" id="entity_id" value="" />
            <input type="hidden" id="entity_type" value="{{{ENTITY_STORY}}}" />
            <div class="comment-list">
            </div>

            <div class="new-comment-form-wrapper">
              <h6>Add a new comment</h6>
              <form action="#" method="POST" class="form-vertical form-validate new-comment-form" data-container="#modal-edit-story .tab-comment" autocomplete=off>
                <div class="control-group">
                  <div class="controls">
                    <textarea name="comment-message-new" class=span12" rows="3" data-rule-minlength="10" data-rule-required="true" placeholder="Message here"></textarea>
                  </div>
                </div>
                <button type="submit" class="btn btn-primary pull-right btn-new-comment">Post comment</button>
              </form>
            </div>

            <div class="reply-comment-form-temp">
              <h6>Reply to this comment</h6>
              <form action="#" method="POST" class='form-vertical form-validate' data-reply-to="" data-container="#modal-edit-story .tab-comment" autocomplete=off>
                <div class="control-group">
                  <div class="controls">
                    <textarea name="comment-message" id="comment-message" class="span12" data-rule-minlength="10" data-rule-required="true" rows="3" placeholder="Message here"></textarea>
                  </div>
                </div>
                <a class="btn cancel-reply-comment pull-right">Cancel</a>
                <span class="loader"><img src="{{asset("img/loading.gif")}}" /></span>
                <span class="loader"><img src="{{asset("img/loading.gif")}}" /></span>
                <input type="submit" class="btn btn-primary pull-right btn-reply-comment-submit" value="Post comment">
              </form>
            </div>

            <div class="comment-temp" style="display: none">
              <div class="media" id="id-comment">
                <a class="pull-left" href="#">
                  <img src="<?php echo asset('data/image/user/' . $cur_user['image']); ?>">
                </a>
                <div class="media-body">
                  <h6 class="media-heading"><span class="user-comment">{{{$cur_user['name']}}}</span><small><span class="time-comment"></span></small></h6>
                  <p class="content-comment"></p>
                  <div class="media-actions">
                    <a href="#" class="btn btn-small btn-reply-comment" data-container=""><i class="icon-reply"></i> Reply</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="tab-pane tab-activity" id="tab-story-activity">
          <div class="modal-body">
            <div class="activity-temp" style="display: none;">
              <li>
                <div class="timeline-content row-fluid">
                  <div class="left">
                    <div class="icon">
                      <img alt="" class="img-user-info" src="">
                    </div>
                  </div>
                  <div class="activity span11">
                    <p class="activity-text"></p>
                    <div class="datetime activity-time"></div>
                  </div>
                </div>
                <div class="line"></div>
              </li>
            </div>
            <ul class="timeline">

            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>