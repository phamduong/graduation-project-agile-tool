<div id="modal-add-project" class="modal modal-custom hide fade box box-color modal-with-tab no-border" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
  <div class="modal-dialog modal-lg">
    <form class="form-horizontal form-validate" id="form-add-project" autocomplete="off" accept-charset="utf-8">
      <div class="box-title">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3 id="myModalLabel"><i class="icon-plus-sign-alt"></i>Add new project</h3>
        <ul class="tabs">
          <li class="active">
            <a href="#tab-proj-info-add" data-toggle="tab">Project informations</a>
          </li>
          <li>
            <a href="#tab-proj-settings-add" data-toggle="tab">Project settings</a>
          </li>
        </ul>
      </div>
      <div class="box-content">
        <div class="tab-content row-fluid">
          <div class='alert_block'></div>
          <div class="tab-pane active" id="tab-proj-info-add">
            <div class="modal-body">
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
                <label for="leader" class="control-label">Select product leader</label>
                <div class="controls">
                  <div class="add-min-height">
                    <input type="hidden" name="leader" id="leader1" class="span8" data-rule-required="true"/>
                  </div>
                  <span class="help-block"><a href="#" data-selected="leader" data-backdrop="static" data-keyboard="false" id="btn-add-user" role="button" class="btn-add-user" data-toggle="modal"><i class="icon-plus"></i> Or add product leader here</a></span>
                </div>
              </div>

              <div class="control-group">
                <label for="owner" class="control-label">Select product owner</label>
                <div class="controls">
                  <div class="add-min-height">
                    <input type="hidden" name="owner" id="owner1" class="span8" data-rule-required="true"/>
                  </div>
                  <span class="help-block"><a href="#" data-selected="owner" data-backdrop="static" data-keyboard="false" id="btn-add-user" role="button" class="btn-add-user" data-toggle="modal"><i class="icon-plus"></i> Or add product owner here</a></span>
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
                <div class="controls attach">
                  <input type="file" name="attach[]" id="project-attach-add" multiple/>
                </div>
              </div>
            </div>
            <div class="modal-footer">
              <input type="submit" class="btn btn-primary" value="Add project">
              <span class="loader"><img src="{{asset("img/loading.gif")}}" /></span>
              <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
            </div>
          </div>

          <div class="tab-pane" id="tab-proj-settings-add">
            <div class="modal-body">
              <div class="control-group">
                <!--<div class="controls">-->
                <div class="check-demo-col">
                  <div class="check-line">
                    <input type="checkbox" id="allow_out_view" checked="checked"> 
                    <label class='inline' for="allow_out_view">Allow user not in project to view this project</label>
                  </div>                  
                </div>
                <!--</div>-->
              </div>
            </div>
          </div>
        </div>
      </div>
    </form>

  </div>
</div>