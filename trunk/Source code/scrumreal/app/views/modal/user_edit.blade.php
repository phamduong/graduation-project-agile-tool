<div id="modal-edit-user" class="modal modal-custom hide fade box box-color modal-with-tab" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">    
    <div class="box-title">
      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
      <h3 id="myModalLabel"><i class="user_add"></i>Edit user</h3>
      <ul class="tabs">
        <li class="active">
          <a href="#tab-user-info" data-toggle="tab">User information</a>
        </li>
        <li>
          <a href="#tab-proj-list" data-toggle="tab">Attended project</a>
        </li>
      </ul>
    </div>

    <div class="box-content">
      <div class="tab-content row-fluid">
        <div class='alert_block'></div>
        <div class="tab-pane active" id="tab-user-info">
          <!--<div class="box-content row-fluid">-->
          <div class="modal-body">
            <form action="#" method="POST" class="form-horizontal form-validate" id="form-edit-project">
              <div class="control-group">
                <label for="fullname" class="control-label">Full name </label>
                <div class="controls">
                  <input disabled="disabled" type="text" name="fullname" id="fullname" class="span8" >
                </div>
              </div>
              <div class="control-group">
                <label for="fullname" class="control-label">Birth day </label>
                <div class="controls">
                  <input disabled="disabled" type="text" name="birthday" id="birthday" class="span8" >
                </div>
              </div>
              <div class="control-group">
                <label for="fullname" class="control-label">Image </label>
                <div class="controls">
                  <image id="user_image" style="width: 120px; height: 120px;" src="" /> 
                </div>
              </div>
            </form>
          </div>
          <!--</div>-->

        </div>

        <div class="tab-pane" id="tab-proj-list">
          <div class="modal-body">
            <table id="project-attend-table">
              <thead>
                <tr>
                  <th>Project name</th>
                  <th>Start date</th>
                  <th>End date</th>
                  <th>Status</th>
                </tr>
              </thead>
              <tbody>                
              </tbody>
            </table>
          </div>
        </div>

        <div class="modal-footer">
        <!--<input type="submit" class="btn btn-primary" value="Save user">-->
          <button class="btn btn-red delete-user" data-uid="" data-status="" aria-hidden="true">Delete</button>
          <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
        </div>

      </div>
    </div>

  </div>
</div>