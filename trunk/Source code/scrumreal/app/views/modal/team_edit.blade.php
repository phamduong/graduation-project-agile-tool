<div id="modal-edit-team" class="modal modal-custom hide fade box box-color teal modal-with-tab" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="box-title">
      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
      <h3 id="myModalLabel"><i class="icon-edit"></i> Edit team</h3>
      <ul class="tabs">
        <li class="active">
          <a href="#tab-proj-info-edit" data-toggle="tab">Team infomations</a>
        </li>
        <li>
          <a href="#tab-comment" data-toggle="tab">Comment</a>
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
          <form action="#" method="POST" class='form-horizontal form-validate' id="form-edit-team">
            <div class="box-content row-fluid">
              <div class="modal-body">
                <div class='alert_block'></div>
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
                      <select name="master" id="master" class="select2-me span8" data-placeholder="Please select" data-rule-required="true">
                        <option value=""></option>
                        @foreach($free_user as $user)
                        <option value="{{{$user->uid}}}">{{{$user->fullname}}}</option>
                        @endforeach
                      </select>
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
              <span class="loader"><img src="img/loading.gif" /></span>
              <input type="submit" class="btn btn-primary" value="Add team">
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
        <div class="tab-pane" id="tab-proj-activity">
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