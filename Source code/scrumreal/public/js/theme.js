$(document).ready(function() {
  //User skill tag in add user modal
  $(".chosen-container").removeAttr('style').addClass('span12');
  $(".chosen-container").css('margin-left', '0px');
  $(".chosen-container .search-field input").removeAttr('style').addClass('span10');

  //Reply to a comment
  $(".comment-list").on("click", ".btn-reply-comment", function(event) {
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
    //var form_id = $(this).parent().parent().parent().attr("id");
    var parent_id = $(this).attr("href");
    var container = $(this).attr("data-container");
    $(reply_form).addClass("reply-comment-form").attr("id", "reply_to_" + parent_id).html($(".reply-comment-form-temp").html()).appendTo($(this).parent().parent());
    $("#reply_to_" + parent_id).find("textarea").focus();
    event.preventDefault();
  });

  $(".comment-list").on("click", ".cancel-reply-comment", function() {
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
          })
          .ajaxError(function(event, jqxhr, settings, exception) {
//            console.log(jqxhr);
//            console.log(settings);
//            console.log(exception);
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
        alert_block.hide();
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

function getComment(selector, comment) {
  var com_tab = selector + " #tab-comment";
  $(com_tab + " .comment-list").html("");
  if (typeof comment.entity_id != "undefined" && typeof comment.entity_type != "undefined") {
    var html = '';
    $(com_tab + " #entity_id").val(comment.entity_id);
    $(com_tab + " #entity_type").val(comment.entity_type);
    $.each(comment.list, function(index, value) {
      if (typeof value != "undefined") {
        if (value.parent_id == null) {
          html = '<div class="media" id="' + value.cid + '">';
          html += '<a class="pull-left" href="#">'
          html += '<img src="data/image/user/' + value.user_image + '"></a>';
          html += '<div class="media-body">';
          html += '<h6 class="media-heading">' + value.user_name + ' <small>' + value.time + '</small></h6>';
          html += '<p>' + value.content + '</p>';
          html += '<div class="media-actions">';
          html += '<a href="' + value.cid + '" class="btn btn-small btn-reply-comment" data-container="' + com_tab + '"><i class="icon-reply"></i> Reply</a>';
          html += '</div>';
          //children
          html += getChildComment(value.cid, comment.list, com_tab);
          delete comment.list[index];
          html += '</div>'; //media-body
          html += '</div>';
        }
      }
      $(com_tab + " .comment-list").append(html);
      html = '';
    });
    //Check to show or do not show load more button
//    if (typeof comment.count_from != "undefined") {
//      showLoadMore(com_tab, comment.count_from, comment.count);
//    }
  }
}

function getChildComment(cid, list_com, container) {
  var html = '';
  if (list_com.length === 0) {
    return html;
  }
  $.each(list_com, function(index, value) {
    if (typeof value != "undefined") {
      if (value.parent_id === cid) {
        html += '<div class="media" id="' + value.cid + '">';
        html += '<a class="pull-left" href="#">'
        html += '<img src="data/image/user/' + value.user_image + '"></a>';
        html += '<div class="media-body">';
        html += '<h6 class="media-heading">' + value.user_name + ' <small>' + value.time + '</small></h6>';
        html += '<p>' + value.content + '</p>';
        html += '<div class="media-actions">';
        html += '<a href="' + value.cid + '" class="btn btn-small btn-reply-comment" data-container="' + container + '"><i class="icon-reply"></i> Reply</a>';
        html += '</div>';
        html += getChildComment(value.cid, list_com);
        delete list_com[index];
        html += '</div>'; //media-body
        html += '</div>';
      }
    }
  });
  return html;
}

function showLoadMore(selector, count_from, count) {
  selector = selector.trim() + " ";
  $(selector + ".load-more").attr('data-count-from', count_from);
  $(selector + ".load-more").attr('data-count', count);
  $(selector + ".load-more").show();
}
