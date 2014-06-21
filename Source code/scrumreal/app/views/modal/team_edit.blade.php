<div id="modal-edit-team" class="modal modal-custom hide fade box box-color modal-with-tab" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="box-title">
      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
      <h3 id="myModalLabel"><i class="icon-edit"></i> Edit team</h3>
      <ul class="tabs">
        <li class="active">
          <a href="#tab-team-info-edit" data-toggle="tab">Team infomations</a>
        </li>
        <li>
          <a href="#tab-team-comment" data-toggle="tab">Comment</a>
        </li>
        <li>
          <a href="#tab-team-activity" data-toggle="tab">Activity</a>
        </li>
      </ul>
    </div>
    <div class="box-content">
      <div class="tab-content row-fluid">
        <div class="alert_block"></div>
        <div class="tab-pane active" id="tab-team-info-edit">
          <form action="#" method="POST" class='form-horizontal form-validate' id="form-edit-team">
            <div class="box-content row-fluid">
              <div class="modal-body">
                <input type="hidden" value="" name="tid" id="tid" />
                <div class="control-group">
                  <label for="name" class="control-label">Team name <small>Require</small></label>
                  <div class="controls">
                    <input type="text" placeholder="Input team name here" name="name" id="name" class="span8" data-rule-required="true">
                  </div>
                </div>
                <div class="control-group">
                  <label for="master" class="control-label">Scrum Master</label>
                  <div class="controls">
                    <div class="add-min-height">
                      <input type="hidden" name="master" id="master2" class="span8" />
                    </div>
                  </div>
                </div>
                <div class="control-group">
                  <label for="description" class="control-label">Description</label>
                  <div class="controls">
                    <textarea name="description" id="description" class="input-block-level span11" placeholder="Input team's description here" data-rule-required="false"></textarea>
                  </div>
                </div>
              </div>
            </div>
            <div class="modal-footer">
              <span class="loader"><img src="{{asset("img/loading.gif")}}" /></span>
              <input type="submit" class="btn btn-primary" value="Save team">
              <button class="btn btn-red delete-team" data-tid="" aria-hidden="true">Delete</button>
              <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
            </div>
          </form>
        </div>
        <div class="tab-pane tab-comment" id="tab-team-comment">
          <div class="modal-body">
            <input type="hidden" id="entity_id" value="" />
            <input type="hidden" id="entity_type" value="{{{ENTITY_TEAM}}}" />
            <div class="comment-list">
            </div>

            <div class="new-comment-form-wrapper">
              <h6>Add a new comment</h6>
              <form action="#" method="POST" class="form-vertical form-validate new-comment-form" data-container="#modal-edit-team .tab-comment" autocomplete=off>
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
              <form action="#" method="POST" class='form-vertical form-validate' data-reply-to="" data-container="#modal-edit-team .tab-comment" autocomplete=off>
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
        <div class="tab-pane tab-activity" id="tab-team-activity">
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