<div id="modal-add-team" class="modal modal-custom hide fade box box-color teal modal-with-tab" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <form action="#" method="POST" class='form-horizontal form-validate' id="form-add-team">
      <div class="box-title">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3 id="myModalLabel"><i class="user_add"></i>Add new team</h3>
      </div>
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
        <span class="loader"><img src="{{asset("img/loading.gif")}}" /></span>
        <input type="submit" class="btn btn-primary" value="Add team">
        <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
      </div>
    </form>
  </div>
</div>