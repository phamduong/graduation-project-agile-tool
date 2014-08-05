<div id="modal-add-user" class="modal modal-custom hide fade box box-color modal-with-tab" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <input type="hidden" id="selected-role" value="" />
    <form action="#" class='form-horizontal form-validate' id="form-add-user" autocomplete="off">
      <div class="box-title">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3 id="myModalLabel"><i class="user_add"></i>Add new user</h3>
      </div>
      <div class="box-content row-fluid">
        <div class="modal-body">
          <div class='alert_block'></div>
          <div class="control-group">
            <label for="fullname" class="control-label">Full name <small>Require</small></label>
            <div class="controls">
              <input type="text" placeholder="Input user name here" name="fullname" id="fullname" class="span8" 
                     data-rule-required="true"
                     data-msg-required="Please input user name"
                     data-rule-minlength="5"
                     data-msg-minlength=">5 chars"
                     data-rule-maxlength="500"
                     data-msg-maxlength="<500 chars">
            </div>
          </div>
          <div class="control-group">
            <label for="login_nm" class="control-label">Login name <small>Require</small></label>
            <div class="controls">
              <input type="text" placeholder="Input user name here" name="login_nm" id="login_nm" class="span8" data-rule-required="true">
            </div>
          </div>
          <div class="control-group">
            <label for="birthday_2" class="control-label">Birthday <small>Require</small></label>
            <div class="controls">
              <input type="text" placeholder="Pick user's birthday" name="birthday" id="birthday_2" class="span8 datepick" data-msg-required="Please pick user's birthday" data-rule-required="true">
            </div>
          </div>
<!--          <div class="control-group">
            <label for="timezone" class="control-label">Select Time zone <small>Require</small></label>
            <div class="controls">
              <div class="add-min-height">
                <select name="timezone" id="timezone" class="select2-me span8" data-placeholder="Please select" data-rule-required="true">
                  <option value=""></option>
                  <option value="-12.0">(GMT -12:00) Eniwetok, Kwajalein</option>
                  <option value="-11.0">(GMT -11:00) Midway Island, Samoa</option>
                  <option value="-10.0">(GMT -10:00) Hawaii</option>
                  <option value="-9.0">(GMT -9:00) Alaska</option>
                  <option value="-8.0">(GMT -8:00) Pacific Time (US &amp; Canada)</option>
                  <option value="-7.0">(GMT -7:00) Mountain Time (US &amp; Canada)</option>
                  <option value="-6.0">(GMT -6:00) Central Time (US &amp; Canada), Mexico City</option>
                  <option value="-5.0">(GMT -5:00) Eastern Time (US &amp; Canada), Bogota, Lima</option>
                  <option value="-4.0">(GMT -4:00) Atlantic Time (Canada), Caracas, La Paz</option>
                  <option value="-3.5">(GMT -3:30) Newfoundland</option>
                  <option value="-3.0">(GMT -3:00) Brazil, Buenos Aires, Georgetown</option>
                  <option value="-2.0">(GMT -2:00) Mid-Atlantic</option>
                  <option value="-1.0">(GMT -1:00 hour) Azores, Cape Verde Islands</option>
                  <option value="0.0">(GMT) Western Europe Time, London, Lisbon, Casablanca</option>
                  <option value="1.0">(GMT +1:00 hour) Brussels, Copenhagen, Madrid, Paris</option>
                  <option value="2.0">(GMT +2:00) Kaliningrad, South Africa</option>
                  <option value="3.0">(GMT +3:00) Baghdad, Riyadh, Moscow, St. Petersburg</option>
                  <option value="3.5">(GMT +3:30) Tehran</option>
                  <option value="4.0">(GMT +4:00) Abu Dhabi, Muscat, Baku, Tbilisi</option>
                  <option value="4.5">(GMT +4:30) Kabul</option>
                  <option value="5.0">(GMT +5:00) Ekaterinburg, Islamabad, Karachi, Tashkent</option>
                  <option value="5.5">(GMT +5:30) Bombay, Calcutta, Madras, New Delhi</option>
                  <option value="5.75">(GMT +5:45) Kathmandu</option>
                  <option value="6.0">(GMT +6:00) Almaty, Dhaka, Colombo</option>
                  <option value="7.0">(GMT +7:00) Bangkok, Hanoi, Jakarta</option>
                  <option value="8.0">(GMT +8:00) Beijing, Perth, Singapore, Hong Kong</option>
                  <option value="9.0">(GMT +9:00) Tokyo, Seoul, Osaka, Sapporo, Yakutsk</option>
                  <option value="9.5">(GMT +9:30) Adelaide, Darwin</option>
                  <option value="10.0">(GMT +10:00) Eastern Australia, Guam, Vladivostok</option>
                  <option value="11.0">(GMT +11:00) Magadan, Solomon Islands, New Caledonia</option>
                  <option value="12.0">(GMT +12:00) Auckland, Wellington, Fiji, Kamchatka</option>
                </select></div>
              <span class="help-block"><a href="#modal-add-user" data-backdrop="static" data-keyboard="false" id="btn-add-user" role="button" class="" data-toggle="modal"><i class="icon-plus"></i> Or add product owner here</a></span>
            </div>
          </div>-->
        </div>
      </div>
      <div class="modal-footer">
        <input type="submit" class="btn btn-primary" value="Add user">
        <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
      </div>
    </form>
  </div>
</div>