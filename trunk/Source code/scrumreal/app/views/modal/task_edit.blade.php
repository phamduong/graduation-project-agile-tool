<div id="modal-edit-task" class="modal modal-custom hide fade box box-color teal modal-with-tab" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="box-title">
      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
      <h3 id="myModalLabel"><i class="icon-edit"></i> Edit task</h3>
      <ul class="tabs">
        <li class="active">
          <a href="#tab-task-info-edit" data-toggle="tab">Task information</a>
        </li>
        <li>
          <a href="#tab-task-comment" data-toggle="tab">Comment</a>
        </li>
        <li>
          <a href="#tab-task-activity" data-toggle="tab">Activity</a>
        </li>
      </ul>
    </div>        
    <div class="box-content">
      <div class="tab-content row-fluid">
        <div class="alert_block"></div>
        <div class="tab-pane active" id="tab-task-info-edit">
          <form action="#" method="POST" class='form-horizontal form-validate' id="form-edit-task">
            <div class="box-content row-fluid">
              <div class="modal-body">
                <input type="hidden" id="taid" name="taid" value=""/>
                <div class="control-group">
                  <label for="name" class="control-label">Task name <small>Require</small></label>
                  <div class="controls">
                    <input type="text" placeholder="Input task name here" name="name" id="name" class="span8" data-rule-required="true">
                  </div>
                </div>

                <div class="control-group">
                  <label for="time_estimate" class="control-label">Estimate time <small>day(s)</small></label>
                  <div class="controls">
                    <input type="text" name="time_estimate" id="time_estimate" placeholder="Estimate time (count by day)" class="span8" data-rule-number="true" data-rule-required="true">
                  </div>
                </div>

                <div class="control-group">
                  <label for="time_remain" class="control-label">Remain time <small>day(s)</small></label>
                  <div class="controls">
                    <input type="text" name="time_remain" id="time_remain" placeholder="Remain time (count by day)" class="span8" data-rule-number="true">
                  </div>
                </div>

                <div class="control-group">
                  <label for="status" class="control-label">Status </label>
                  <div class="controls">
                    <input type="text" name="status" id="status" placeholder="Task status" class="span8" disabled="disabled">
                  </div>
                </div>

                <div class="control-group">
                  <label for="create_date" class="control-label">Create date </label>
                  <div class="controls">
                    <input type="text" name="create_date" id="create_date" placeholder="Create date" class="span8" disabled="disabled">
                  </div>
                </div>

                <div class="control-group">
                  <label for="create_user" class="control-label">Create user </label>
                  <div class="controls">
                    <input type="text" name="create_user" id="create_user" placeholder="Create user" class="span8" disabled="disabled">
                  </div>
                </div>

                <div class="control-group">
                  <label for="uid" class="control-label">Assign</label>
                  <div class="controls">
                    <div class="add-min-height">
                      <select name="uid" id="uid" class="span8" data-placeholder="User that assign to that task">
                      </select>
                    </div>
                    <span class="help-block">Story must be assigned to team before selecting user who will take this task.</span>
                  </div>
                </div>

                <div class="control-group">
                  <label for="description" class="control-label">Description</label>
                  <div class="controls">
                    <textarea name="description" id="description" class="input-block-level span11" placeholder="Description"></textarea>
                  </div>
                </div>
              </div>
            </div>
            <div class="modal-footer">
              <span class="loader"><img src="{{asset("img/loading.gif")}}" /></span>
              <input type="submit" class="btn btn-primary" value="Save task">
              <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
            </div>
          </form>
        </div>

        <div class="tab-pane tab-comment" id="tab-task-comment">
          <div class="modal-body">
            <input type="hidden" id="entity_id" value="" />
            <input type="hidden" id="entity_type" value="{{{ENTITY_SPRINT}}}" />
            <div class="comment-list">
            </div>
            <div class="new-comment-form-wrapper">
              <h6>Add a new comment</h6>
              <form action="#" method="POST" class="form-vertical form-validate new-comment-form" data-container="#modal-edit-sprint .tab-comment" autocomplete=off>
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
              <form action="#" method="POST" class='form-vertical form-validate' data-reply-to="" data-container="#modal-edit-sprint .tab-comment" autocomplete=off>
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

        <div class="tab-pane tab-activity" id="tab-task-activity">
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