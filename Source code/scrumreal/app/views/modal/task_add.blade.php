<div id="modal-add-task" class="modal modal-custom hide fade box box-color teal modal-with-tab" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <form action="#" method="POST" class='form-horizontal form-validate' id="form-add-task">
      <div class="box-title">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3 id="myModalLabel"><i class="user_add"></i>Add new task</h3>
      </div>
      <div class="box-content row-fluid">
        <div class="modal-body">
          <div class='alert_block'></div>
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
            <label for="description" class="control-label">Description</label>
            <div class="controls">
              <textarea name="description" id="description" class="input-block-level span11" placeholder="Input sprint's description here"></textarea>
            </div>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <span class="loader"><img src="{{asset("img/loading.gif")}}" /></span>
        <input type="submit" class="btn btn-primary" value="Add task">
        <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
      </div>
    </form>
  </div>
</div>