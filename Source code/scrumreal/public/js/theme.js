$(document).ready(function() {
  //Init comment form submit event handler
  initComment();

  //Processing icon
  var $loading = $(".loader").hide();
  $(document)
          .ajaxStart(function() {
            $loading.show();
          })
          .ajaxStop(function() {
            $loading.hide();
          })
          .ajaxError(function(event, jqxhr, settings, exception) {
            var err = jQuery.parseJSON(jqxhr.responseText);
            showAlert(0, true, err.error.message);
            $loading.hide();
          });

  //Add new user
  $("#form-add-user").submit(function(event) {
    if ($(this).valid() === true) {
      $.ajax({
        url: 'user/add',
        type: 'POST',
        data: $(this).serialize(),
        success: function(response) {
          if (response.status === 800) { //error
            showAlert(0, true, response.message);
          } else if (response.status === 200) {
            showAlert(1, true, response.message);
            if ($("#selected-role").val() != "") {
              var select = $("#modal-add-project " + "#" + $("#selected-role").val());
              var temp = '<option value="' + response.user.uid + '">' + response.user.full_name + '</option>';
              select.append(temp);
              select.select2("data", {id: response.user.uid, text: response.user.full_name});
              $("#selected-role").val("");
              setTimeout(function() {
                $("#modal-add-project").modal('hide');
              }, 1500);
            }
          }
        }
      });
    }
    event.preventDefault();
  });

  //Load more comment
  $(".load-more").click(function() {
    var container = $(this).attr("data-box-id");
    alert(container);
  });
});

/**
 * Only show loading to specific HTML element
 * @param {type} wrapper
 * @returns {undefined}
 */
function showLoading(wrapper) {
  if (typeof wrapper != "undefined") {
    $(wrapper).find(".loader").show();
  } else {
    $(".loader").show();
  }
}

/**
 * Hide loading gif 
 * @param {type} wrapper
 * @returns {undefined}
 */
function hideLoading(wrapper) {
  if (typeof wrapper != "undefined") {
    $(wrapper).find(".loader").hide();
  }
}

/**
 * Show status
 * @param {type} id
 * @param {type} status_type
 * @param {type} content
 * @returns {undefined}
 */
function showStatus(id, status_type, content) {
  var text = "";
  switch (status_type) {
    case "info":
      text = '<span class="label label-info">' + content + '</span>';
      break;
    case "success":
      text = '<span class="label label-success">' + content + '</span>';
      break;
    case "warning":
      text = '<span class="label label-warning">' + content + '</span>';
      break;
    case "error":
      text = '<span class="label label-important">' + content + '</span>';
      break;
  }
  $("#" + id).find(".actions").append(text);
}

function showMessage(id, mes_type, content) {
}

/**
 * Show alert box after processing
 * @param {type} type
 * @param {type} valid
 * @param {type} msg
 * @returns {undefined}
 */
function showAlert(type, valid, msg) {
  var alert_block = $(".alert_block");
  if (valid === false) {
    alert_block.hide();
  } else {
    var cls = "";
    var header = "";
    switch (type) {
      case 0: //Error
        cls = "alert-error";
        header = "Error!";
        break;
      case 1: //Success
        cls = "alert-success";
        header = "Success!";
        break;
      case 2: //Info
        cls = "alert-info";
        header = "Info!";
        break;
      case 3: //Warning
        cls = "";
        header = "Warning!";
        break;
    }
    var alertmsg = "";
    alertmsg += "<div class='alert " + cls + "'>";
    alertmsg += "<button type='button' class='close' data-dismiss='alert'>&times;</button>";
    alertmsg += "<strong>" + header + " </strong>";
    alertmsg += msg;
    alertmsg += "</div>";
    alert_block.html(alertmsg);
    alert_block.show(function() {
      setTimeout(function() {
        alert_block.hide("slow");
      }, 5000);
    });
  }
}

/**
 * Check image upload
 * @param {type} selector input upload tag
 * @returns {Boolean}
 */
function checkImageUpload(selector) {
  //check whether browser fully supports all File API
  if (window.File && window.FileReader && window.FileList && window.Blob) {
    if (!$(selector).val()) { //check empty input filed
//      showAlert(0, true, "No Image");
      return false;
    }
    var fsize = $(selector)[0].files[0].size; //get file size
    var ftype = $(selector)[0].files[0].type; // get file type

    //allow only valid image file types 
    switch (ftype) {
      case 'image/png':
      case 'image/gif':
      case 'image/jpeg':
      case 'image/pjpeg':
        break;
      default:
        showAlert(0, true, "Unsupported file type!");
        return false;
    }
    //Allowed file size is less than 5 MB (1048576 * 5)
    if (fsize > (1048576 * 5)) {
      showAlert(0, true, "<b>" + fsize + "</b> Too big Image file! <br />Please reduce the size of your photo using an image editor.")
      return false;
    }
  }
  else {
    //Output error to older unsupported browsers that doesn't support HTML5 File API
    return false;
  }
}
/**
 * Check if form value change
 * @param {type} form
 * @returns {change|Boolean}
 */
function checkChange(form) {
  change = false;
  $(form + " input").not("[type='file']").each(function() {
    if (typeof ($(this).attr("data-current")) !== "undefined") {
//      console.log($(this).attr("data-current") + " -- " + $(this).val());
      if ($(this).attr("data-current") !== $(this).val()) {
        change = true;
      }
    }
  });
  $(form + " input[type='file']").each(function() {
    if ($(this).val() !== "") {
      change = true;
    }
  });
  $(form + " select").each(function() {
    if (typeof ($(this).attr("data-current")) !== "undefined") {
//      console.log($(this).attr("data-current") + " -- " + $(this).val());
      if ($(this).attr("data-current") !== $(this).val()) {
        change = true;
      }
    }
  });
  return change;
}

function clearFormInput(selector) {
  $(selector + " input").not("[type='submit']").each(function() {
    $(this).val("");
  });
  $(selector + " select").each(function() {
    $(this).val("");
  });
  $(selector + " textarea").each(function() {
    $(this).val("");
  });
}

/**
 * Reassign value to form after processing (ex: ajax...)
 * @param {type} form
 * @returns {undefined}
 */
function reAssignVal(form) {
  $(form + " input[data-current]").each(function() {
    $(this).attr('data-current', $(this).val());
  });
}

function showLoadMore(selector, count_from, count) {
  selector = selector.trim() + " ";
  $(selector + ".load-more").attr('data-count-from', count_from);
  $(selector + ".load-more").attr('data-count', count);
  $(selector + ".load-more").show();
}
