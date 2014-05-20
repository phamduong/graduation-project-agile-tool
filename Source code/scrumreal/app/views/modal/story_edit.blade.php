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
          <a href="#tab-comment" data-toggle="tab">Comment</a>
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
          <form action="#" method="POST" class='form-horizontal form-validate' id="form-add-story">
            <div class="box-content row-fluid">
              <div class="modal-body">
                <div class="control-group">
                  <label for="name" class="control-label">Story name <small>Require</small></label>
                  <div class="controls">
                    <input type="text" placeholder="Input story name here" name="name" id="name" class="span8">
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
                    <select name="status" id="status" data-rule-required="true" class="span8">
                      <option value=""></option>
                      <option value="1">New</option>
                      <option value="2">Estimated</option>
                      <option value="3">Assigned to sprint</option>
                      <option value="4">To do</option>
                      <option value="5">In progress</option>
                      <option value="6">To test</option>
                      <option value="7">Done</option>
                      <option value="8">Sprint completed</option>
                    </select>
                  </div>
                </div>
                <div class="control-group">
                  <label for="time_estimate" class="control-label">Estimate time <small>Require</small></label>
                  <div class="controls">
                    <input type="text" placeholder="Input story name here" name="time_estimate" id="time_estimate" class="span8">
                  </div>
                </div>
                <div class="control-group">
                  <label for="sprint" class="control-label">Sprint</label>
                  <div class="controls">
                    <div class="add-min-height"><select name="sprint" id="sprint" class="select2-me span8" data-placeholder="Please select">
                        <option value=""></option>
                        <option value="1">Sprint 1</option>
                        <option value="2">Sprint 2</option>
                        <option value="3">Sprint 3</option>
                        <option value="4">Sprint 4</option>
                      </select></div>
                    <span class="help-block">Add sprint</span>
                  </div>
                </div>
                <div class="control-group">
                  <label for="team" class="control-label">Team</label>
                  <div class="controls">
                    <div class="add-min-height"><select name="team" id="team" class="select2-me span8" data-placeholder="Please select">
                        <option value=""></option>
                        <option value="1">Team 1</option>
                        <option value="2">Team 2</option>
                        <option value="3">Team 3</option>
                        <option value="4">Team 4</option>
                      </select></div>
                    <span class="help-block">Add team</span>
                  </div>
                </div>
                <div class="control-group">
                  <label for="story-rough-estimate" class="control-label">Rough estimate <small>Require</small></label>
                  <div class="controls">
                    <input type="text" placeholder="Story points" name="story-rough-estimate" id="story-rough-estimate" class="span8">
                  </div>
                </div>
                <div class="control-group">
                  <label for="story-demo-way" class="control-label">How to demo <small>Require</small></label>
                  <div class="controls">
                    <textarea name="story-demo-way" id="story-demo-way" class="input-block-level span11" placeholder="Describe how to demo story"></textarea>
                  </div>
                </div>
                <div class="control-group">
                  <label for="story-description" class="control-label">Description <small>Require</small></label>
                  <div class="controls">
                    <textarea name="story-description" id="story-description" class="input-block-level span11" placeholder="Describe story"></textarea>
                  </div>
                </div>
              </div>
            </div>
            <div class="modal-footer">
              <span class="loader"><img src="img/loading.gif" /></span>
              <input type="submit" class="btn btn-primary" value="Add story">
              <button class="btn btn-red" aria-hidden="true">Approve</button>
              <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
            </div>
          </form>
        </div>

        <div class="tab-pane" id="tab-comment">
          <div class="modal-body">
            <input type="hidden" id="entity_id" value="" />
            <input type="hidden" id="entity_type" value="" />
            <div class="comment-list">
            </div>

            <div class="new-comment-form-wrapper">
              <h6>Add a new comment</h6>
              <form action="#" method="POST" class="form-vertical form-validate new-comment-form" data-container="" autocomplete=off>
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
              <form action="#" method="POST" class='form-vertical form-validate' data-reply-to="" data-container="" autocomplete=off>
                <div class="control-group">
                  <div class="controls">
                    <textarea name="comment-message" id="comment-message" class="span12" data-rule-minlength="10" data-rule-required="true" rows="3" placeholder="Message here"></textarea>
                  </div>
                </div>
                <a class="btn cancel-reply-comment pull-right">Cancel</a>
                <span class="loader"><img src="img/loading.gif" /></span>
                <span class="loader"><img src="img/loading.gif" /></span>
                <input type="submit" class="btn btn-primary pull-right btn-reply-comment-submit" value="Post comment">
              </form>
            </div>

            <div class="comment-temp" style="display: none">
              <div class="media" id="id-comment">
                <a class="pull-left" href="#">
                  <img src="<?php echo 'data/image/user/' . $cur_user['image']; ?>">
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
        <div class="tab-pane" id="tab-story-activity">
          <div class="modal-body">
            <ul class="timeline">
              <li>
                <div class="timeline-content row-fluid">
                  <div class="left">
                    <div class="icon">
                        <!-- <i class="icon-picture"></i> -->
                      <img alt="" class="img-user-info" src="img/demo/user-1.jpg">
                    </div>
                    <div class="username">Jane Leo Doe</div>
                  </div>
                  <div class="activity span11">
                    <p>
                      <a href="#"class="user">Jane Leo Doe</a> Lorem ipsum Fugiat magna velit consectetur qui in veniam cillum exercitation Ut occaecat Duis mollit. Lorem ipsum Dolore dolor Excepteur sunt amet officia officia sunt aliquip id occaecat officia.
                    </p>
                    <div class="datetime">14 hours ago</div>
                  </div>
                </div>
                <div class="line"></div>
              </li>
              <li>
                <div class="timeline-content row-fluid">
                  <div class="left">
                    <div class="icon">
                        <!-- <i class="icon-picture"></i> -->
                      <img alt="" class="img-user-info" src="img/demo/user-1.jpg">
                    </div>
                    <div class="username">Jane Leo Doe</div>
                  </div>
                  <div class="activity span11">
                    <p>
                      <a href="#"class="user">Jane Leo Doe</a> Lorem ipsum Fugiat magna velit consectetur qui in veniam cillum exercitation Ut occaecat Duis mollit. Lorem ipsum Dolore dolor Excepteur sunt amet officia officia sunt aliquip id occaecat officia.
                      Lorem ipsum Fugiat magna velit consectetur qui in veniam cillum exercitation Ut occaecat Duis mollit. Lorem ipsum Dolore dolor Excepteur sunt amet officia officia sunt aliquip id occaecat officia.
                      Lorem ipsum Fugiat magna velit consectetur qui in veniam cillum exercitation Ut occaecat Duis mollit. Lorem ipsum Dolore dolor Excepteur sunt amet officia officia sunt aliquip id occaecat officia.
                    </p>
                    <div class="datetime">14 hours ago</div>
                  </div>
                </div>
                <div class="line"></div>
              </li>
              <li class="timeline-separated">
                Sunday
              </li>
              <li>
                <div class="timeline-content row-fluid">
                  <div class="left">
                    <div class="icon">
                        <!-- <i class="icon-picture"></i> -->
                      <img alt="" class="img-user-info" src="img/demo/user-1.jpg">
                    </div>
                    <div class="username">Jane Leo Doe</div>
                  </div>
                  <div class="activity span11">
                    <p>
                      <a href="#"class="user">Jane Leo Doe</a> Lorem ipsum Fugiat magna velit consectetur qui in veniam cillum exercitation Ut occaecat Duis mollit. Lorem ipsum Dolore dolor Excepteur sunt amet officia officia sunt aliquip id occaecat officia.
                    </p>
                    <div class="datetime">14 hours ago</div>
                  </div>
                </div>
                <div class="line"></div>
              </li>
              <li>
                <div class="timeline-content row-fluid">
                  <div class="left">
                    <div class="icon">
                        <!-- <i class="icon-picture"></i> -->
                      <img alt="" class="img-user-info" src="img/demo/user-1.jpg">
                    </div>
                    <div class="username">Jane Leo Doe</div>
                  </div>
                  <div class="activity span11">
                    <p>
                      <a href="#"class="user">Jane Leo Doe</a> Lorem ipsum Fugiat magna velit consectetur qui in veniam cillum exercitation Ut occaecat Duis mollit. Lorem ipsum Dolore dolor Excepteur sunt amet officia officia sunt aliquip id occaecat officia.
                    </p>
                    <div class="datetime">14 hours ago</div>
                  </div>
                </div>
                <div class="line"></div>
              </li>
              <li>
                <div class="timeline-content row-fluid">
                  <div class="left">
                    <div class="icon">
                        <!-- <i class="icon-picture"></i> -->
                      <img alt="" class="img-user-info" src="img/demo/user-1.jpg">
                    </div>
                    <div class="username">Jane Leo Doe</div>
                  </div>
                  <div class="activity span11">
                    <p>
                      <a href="#"class="user">Jane Leo Doe</a> Lorem ipsum Fugiat magna velit consectetur qui in veniam cillum exercitation Ut occaecat Duis mollit. Lorem ipsum Dolore dolor Excepteur sunt amet officia officia sunt aliquip id occaecat officia.
                    </p>
                    <div class="datetime">14 hours ago</div>
                  </div>
                </div>
                <div class="line"></div>
              </li>
              <li>
                <div class="timeline-content row-fluid">
                  <div class="left">
                    <div class="icon">
                        <!-- <i class="icon-picture"></i> -->
                      <img alt="" class="img-user-info" src="img/demo/user-1.jpg">
                    </div>
                    <div class="username">Jane Leo Doe</div>
                  </div>
                  <div class="activity span11">
                    <p>
                      <a href="#"class="user">Jane Leo Doe</a> Lorem ipsum Fugiat magna velit consectetur qui in veniam cillum exercitation Ut occaecat Duis mollit. Lorem ipsum Dolore dolor Excepteur sunt amet officia officia sunt aliquip id occaecat officia.
                    </p>
                    <div class="datetime">14 hours ago</div>
                  </div>
                </div>
                <div class="line"></div>
              </li>
              <li>
                <div class="timeline-content row-fluid">
                  <div class="left">
                    <div class="icon">
                        <!-- <i class="icon-picture"></i> -->
                      <img alt="" class="img-user-info" src="img/demo/user-1.jpg">
                    </div>
                    <div class="username">Jane Leo Doe</div>
                  </div>
                  <div class="activity span11">
                    <p>
                      <a href="#"class="user">Jane Leo Doe</a> Lorem ipsum Fugiat magna velit consectetur qui in veniam cillum exercitation Ut occaecat Duis mollit. Lorem ipsum Dolore dolor Excepteur sunt amet officia officia sunt aliquip id occaecat officia.
                    </p>
                    <div class="datetime">14 hours ago</div>
                  </div>
                </div>
                <div class="line"></div>
              </li>
              <li>
                <div class="timeline-content row-fluid">
                  <div class="left">
                    <div class="icon">
                        <!-- <i class="icon-picture"></i> -->
                      <img alt="" class="img-user-info" src="img/demo/user-1.jpg">
                    </div>
                    <div class="username">Jane Leo Doe</div>
                  </div>
                  <div class="activity span11">
                    <p>
                      <a href="#"class="user">Jane Leo Doe</a> Lorem ipsum Fugiat magna velit consectetur qui in veniam cillum exercitation Ut occaecat Duis mollit. Lorem ipsum Dolore dolor Excepteur sunt amet officia officia sunt aliquip id occaecat officia.
                    </p>
                    <div class="datetime">14 hours ago</div>
                  </div>
                </div>
                <div class="line"></div>
              </li>
              <li>
                <div class="timeline-content row-fluid">
                  <div class="left">
                    <div class="icon">
                        <!-- <i class="icon-picture"></i> -->
                      <img alt="" class="img-user-info" src="img/demo/user-1.jpg">
                    </div>
                    <div class="username">Jane Leo Doe</div>
                  </div>
                  <div class="activity span11">
                    <p>
                      <a href="#"class="user">Jane Leo Doe</a> Lorem ipsum Fugiat magna velit consectetur qui in veniam cillum exercitation Ut occaecat Duis mollit. Lorem ipsum Dolore dolor Excepteur sunt amet officia officia sunt aliquip id occaecat officia.
                    </p>
                    <div class="datetime">14 hours ago</div>
                  </div>
                </div>
                <div class="line"></div>
              </li>
              <li>
                <div class="timeline-content row-fluid">
                  <div class="left">
                    <div class="icon">
                        <!-- <i class="icon-picture"></i> -->
                      <img alt="" class="img-user-info" src="img/demo/user-1.jpg">
                    </div>
                    <div class="username">Jane Leo Doe</div>
                  </div>
                  <div class="activity span11">
                    <p>
                      <a href="#"class="user">Jane Leo Doe</a> Lorem ipsum Fugiat magna velit consectetur qui in veniam cillum exercitation Ut occaecat Duis mollit. Lorem ipsum Dolore dolor Excepteur sunt amet officia officia sunt aliquip id occaecat officia.
                    </p>
                    <div class="datetime">14 hours ago</div>
                  </div>
                </div>
                <div class="line"></div>
              </li>
              <li>
                <div class="timeline-content row-fluid">
                  <div class="left">
                    <div class="icon">
                        <!-- <i class="icon-picture"></i> -->
                      <img alt="" class="img-user-info" src="img/demo/user-1.jpg">
                    </div>
                    <div class="username">Jane Leo Doe</div>
                  </div>
                  <div class="activity span11">
                    <p>
                      <a href="#"class="user">Jane Leo Doe</a> Lorem ipsum Fugiat magna velit consectetur qui in veniam cillum exercitation Ut occaecat Duis mollit. Lorem ipsum Dolore dolor Excepteur sunt amet officia officia sunt aliquip id occaecat officia.
                    </p>
                    <div class="datetime">14 hours ago</div>
                  </div>
                </div>
                <div class="line"></div>
              </li>
              <li>
                <div class="timeline-content row-fluid">
                  <div class="left">
                    <div class="icon">
                        <!-- <i class="icon-picture"></i> -->
                      <img alt="" class="img-user-info" src="img/demo/user-1.jpg">
                    </div>
                    <div class="username">Jane Leo Doe</div>
                  </div>
                  <div class="activity span11">
                    <p>
                      <a href="#"class="user">Jane Leo Doe</a> Lorem ipsum Fugiat magna velit consectetur qui in veniam cillum exercitation Ut occaecat Duis mollit. Lorem ipsum Dolore dolor Excepteur sunt amet officia officia sunt aliquip id occaecat officia.
                    </p>
                    <div class="datetime">14 hours ago</div>
                  </div>
                </div>
                <div class="line"></div>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>