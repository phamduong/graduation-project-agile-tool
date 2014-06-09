<div id="modal-add-story" class="modal modal-custom hide fade box box-color lime modal-with-tab" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <form action="#" method="POST" class='form-horizontal form-validate' id="form-add-story" autocomplete="off">
      <div class="box-title">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3 id="myModalLabel"><i class="user_add"></i>Add story</h3>
      </div>
      <div class="box-content row-fluid">
        <div class="modal-body">
          <div class='alert_block'></div>
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
            <label for="demo" class="control-label">How to demo <small>Require</small></label>
            <div class="controls">
              <textarea name="demo" id="demo" class="input-block-level span11" data-rule-required="true" placeholder="Describe how to demo story"></textarea>
            </div>
          </div>
          <div class="control-group">
            <label for="description" class="control-label">Description <small>Require</small></label>
            <div class="controls">
              <textarea name="description" id="description" class="input-block-level span11" data-rule-required="true" placeholder="Describe story"></textarea>
            </div>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <span class="loader"><img src="{{asset("img/loading.gif")}}" /></span>
        <input type="submit" class="btn btn-primary" value="Add story">
        <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
      </div>
    </form>
  </div>
</div>