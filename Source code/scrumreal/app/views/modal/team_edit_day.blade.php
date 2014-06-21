<div id="modal-edit-team-day" class="modal modal-custom hide fade box box-color modal-with-tab" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <form action="#" method="POST" class='form-horizontal form-validate' id="form-edit-team-day">
      <div class="box-title">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3 id="myModalLabel"><i class="user_add"></i>Edit day team</h3>
      </div>
      <div class="box-content row-fluid">
        <div class="modal-body">
          <div class='alert_block'></div>
          <div class="control-group">
            <label for="name" class="control-label">Number of days</label>
            <input type="hidden" name="spid" id="spid" value="" />
            <input type="hidden" name="tid" id="tid" value="" />
            <div class="controls">
              <input type="text" name="num_day" id="num_day" class="span8" data-rule-required="true" data-rule-number="true" placeholder="Total working days of all members in team">
            </div>            
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <span class="loader"><img src="{{asset("img/loading.gif")}}" /></span>
        <input type="submit" class="btn btn-primary" value="Save">
        <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
      </div>
    </form>
  </div>
</div>