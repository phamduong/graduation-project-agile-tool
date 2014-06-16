<div id="modal-edit-user" class="modal modal-custom hide fade box box-color modal-with-tab" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <input type="hidden" id="selected-role" value="" />
    <form action="#" class='form-horizontal form-validate' id="form-edit-user" autocomplete="off">
      <div class="box-title">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3 id="myModalLabel"><i class="user_add"></i>Edit user</h3>
      </div>
      <div class="box-content row-fluid">
        <div class="modal-body">
          <div class='alert_block'></div>
          <div class="control-group">
            <label for="fullname" class="control-label">Full name <small>Require</small></label>
            <div class="controls">
              <input disabled="disabled" type="text" placeholder="Input user name here" name="fullname" id="fullname" class="span8" >
            </div>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <!--<input type="submit" class="btn btn-primary" value="Save user">-->
        <button class="btn btn-red delete-user" data-uid="" data-status="" aria-hidden="true">Delete</button>
        <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
      </div>
    </form>
  </div>
</div>