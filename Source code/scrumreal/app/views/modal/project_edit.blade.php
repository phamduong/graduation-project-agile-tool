<div id="modal-edit-project" class="modal modal-custom hide fade box box-color modal-with-tab" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
  <div class="modal-dialog modal-lg">
    <div class="box-title">
      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
      <h3 id="myModalLabel"><i class="icon-edit"></i>Edit project</h3>
      <ul class="tabs">
        <li class="active">
          <a href="#tab-proj-info-edit" data-toggle="tab">Project informations</a>
        </li>
        <li>
          <a href="#tab-proj-settings-edit" data-toggle="tab">Project settings</a>
        </li>
        <li>
          <a href="#tab-proj-comment" data-toggle="tab">Comment</a>
        </li>
        <li>
          <a href="#tab-proj-activity" data-toggle="tab">Activity</a>
        </li>
      </ul>
    </div>
    <div class="box-content">
      <div class="tab-content row-fluid">
        <div class="alert_block"></div>

        <div class="tab-pane active" id="tab-proj-info-edit">
          <form action="#" method="POST" class="form-horizontal form-validate" id="form-edit-project">
            <input type="hidden" id="pid" val="" />
            <div class="modal-body">
              <input type="hidden" id="pid" name="pid" />
              <div class="control-group">
                <label for="name" class="control-label">Project name <small>Min length: 10</small></label>
                <div class="controls">
                  <input type="text" placeholder="Input project name here" name="name" id="name" data-rule-minlength="10" data-rule-required="true" class="span8">
                </div>
              </div>

              <div class="control-group">
                <label for="project_date_range" class="control-label">Start date - End date</label>
                <div class="controls">
                  <input type="text" name="project_date_range" id="project_date_range" class="span8 daterangepick" data-rule-required="true" data-msg-required="Please pick project's start date and project's end date">
                </div>
              </div>

              <div class="control-group">
                <label for="status" class="control-label">Status</label>
                <div class="controls">
                  <select id="status" name="status" class="span8">
                    <option value="-1">New</option>
                    <option value="0">Canceled</option>
                    <option value="1">Active</option>
                    <option value="2">Complete</option>
                    <option value="3">Pause</option>
                  </select>
                </div>
              </div>

              <div class="control-group">
                <label for="leader" class="control-label">Select product leader</label>
                <div class="controls">
                  <div class="add-min-height">
                    <input type="hidden" name="leader" id="leader2" class="span8" />
                  </div>
                  <span class="help-block"><a href="#modal-add-user" data-selected="1" data-backdrop="static" data-keyboard="false" id="btn-add-user" role="button" class="btn-add-user" data-toggle="modal"><i class="icon-plus"></i> Or add product leader here</a></span>
                </div>
              </div>

              <div class="control-group">
                <label for="owner" class="control-label">Select product owner</label>
                <div class="controls">
                  <div class="add-min-height">
                    <input type="hidden" name="owner" id="owner2" class="span8" />
                  </div>
                  <span class="help-block"><a href="#modal-add-user" data-selected="4" data-backdrop="static" data-keyboard="false" id="btn-add-user" role="button" class="btn-add-user" data-toggle="modal"><i class="icon-plus"></i> Or add product owner here</a></span>
                </div>
              </div>

              <div class="control-group">
                <label for="description" class="control-label">Description</label>
                <div class="controls">
                  <textarea name="description" id="description" class="input-block-level span11" placeholder="Input project's description here"></textarea>
                </div>
              </div>

              <div class="control-group">
                <label for="note" class="control-label">Note</label>
                <div class="controls">
                  <textarea name="note" id="note" class="input-block-level span11" placeholder="Input project's note here"></textarea>
                </div>
              </div>

              <div class="control-group">
                <label for="note" class="control-label">Attach</label>
                <div class="controls attach_files" id="">

                </div>
                <div class="controls">
                  <input type="file" name="attach[]" id="project-attach-update" multiple/>
                </div>
              </div>

            </div>
            <div class="modal-footer">
              <input type="submit" class="btn btn-primary" value="Save project infomation">
              <!--<button class="btn btn-red complete-project" data-pid="" aria-hidden="true">Complete this project</button>-->
              <button class="btn btn-red delete-project" data-pid="" aria-hidden="true">Delete</button>
              <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
            </div>
          </form>
        </div>
        <div class="tab-pane" id="tab-proj-settings-edit">
          <!--<form action="#" method="POST" class='form-horizontal'>-->
          <div class="modal-body">
            <div class="control-group">
              <!--<div class="controls">--> 
              <div class="check-demo-col">
                <div class="check-line">
                  <input type="checkbox" id="allow_out_view"> 
                  <label class='inline' for="allow_out_view">Allow user not in project to view this project</label>
                </div>                  
              </div>
              <!--</div>--> 
            </div>
          </div>
        </div>
        <!--        </form>-->
        <div class="tab-pane tab-activity" id="tab-proj-activity">
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
            <div class="load-more-activity" data-selector="" data-entity-type="" data-entity-id="" data-offset="" data-limit="" >Load More <span class="loader"><img src="img/loading.gif" /></span></div>
          </div>
        </div>
        <div class="tab-pane tab-comment" id="tab-proj-comment">
          <div class="modal-body">
            <input type="hidden" id="entity_id" value="" />
            <input type="hidden" id="entity_type" value="{{{ENTITY_PROJECT}}}" />
            <div class="comment-list">
            </div>

            <div class="new-comment-form-wrapper">
              <h6>Add a new comment</h6>
              <form action="#" method="POST" class="form-vertical form-validate new-comment-form" data-container="#modal-edit-project .tab-comment" autocomplete=off>
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
              <form action="#" method="POST" class='form-vertical form-validate' data-reply-to="" data-container="#modal-edit-project .tab-comment" autocomplete=off>
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
      </div>
    </div>
  </div>
</div>