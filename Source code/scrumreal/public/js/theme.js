$(document).ready(function() {
  //User skill tag in add user modal
  $(".chosen-container").removeAttr('style').addClass('span12');
  $(".chosen-container").css('margin-left', '0px');
  $(".chosen-container .search-field input").removeAttr('style').addClass('span10');
  //Reply to a comment
  $(".comment-list").on("click", ".btn-reply-comment", function() {
    if ($(".comment-list .reply-comment-form").length > 0) {
      //$(".comment-list .reply-comment-form").remove();
      $.each($(".comment-list .reply-comment-form"), function() {
        $(this).parent().find(".media-actions:first").css("display", "block");
        $(this).remove();
      });
    }
    var height = $(this).parent().parent().height();
    var current_top = $(".comment-list").scrollTop();
    $(".comment-list").scrollTop(current_top + height);
    $(this).parent().css('display', 'none');
    var reply_form = document.createElement('div');
    var form_id = $(this).parent().parent().parent().attr("id");
    $(reply_form).addClass("reply-comment-form").attr("id", "reply_to_" + form_id).html($(".reply-comment-form-temp").html()).appendTo($(this).parent().parent());
    $("#reply_to_" + form_id).find("textarea").focus();
  });
  $(".comment-list").on("click", ".cancel-reply-comment", function(e) {
    $(this).parent().parent().parent().find(".media-actions:first").css("display", "block");
    var parent_id = $(this).parent().parent().attr("id");
    $(".comment-list #" + parent_id).remove();
  });

  //Processing icon
  var $loading = $(".loader").hide();
  $(document)
          .ajaxStart(function() {
            $loading.show();
          })
          .ajaxStop(function() {
            $loading.hide();
          });


});

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

function showAlert(type, valid, msg) {
  if (valid === false) {
    $(".alert_block").hide();
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
    $(".alert_block").html(alertmsg);
    $(".alert_block").show();
  }
}

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

function reAssignVal(form) {
  $(form + " input[data-current]").each(function() {
    $(this).attr('data-current', $(this).val());
  });
}