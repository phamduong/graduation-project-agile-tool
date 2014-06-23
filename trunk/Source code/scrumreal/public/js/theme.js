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
            try {
              var err = jQuery.parseJSON(jqxhr.responseText);
              showAlert(0, true, err.error.message);
              $loading.hide();
            } catch (e) {
              console.log(e);
            }

          })
          .ajaxComplete(function(event, jqxhr, settings, exception) {
            try {
              var response = jQuery.parseJSON(jqxhr.responseText);
              if (response.status === 801) {
                showAlertModal(response.message);
              }
            } catch (e) {
              console.log(e);
            }
          });

  //Add new user
  $("#form-add-user").submit(function(event) {
    if ($(this).valid() === true) {
      $.ajax({
        url: '/user/add',
        type: 'POST',
        data: $(this).serialize(),
        success: function(response) {
          if (response.status === 800) { //error
            showAlert(0, true, response.message);
          } else if (response.status === 200) {
            showAlert(1, true, response.message);
            var page = $(location).attr('pathname');
            if (page === "/people") {
              //in people page -> reload staff list
              $("#staff-list .box-content").html();
              $("#staff-list .box-content").load("/people/reload_list_staff");
              setTimeout(function() {
                $("#modal-add-user").modal('hide');
              }, 1500);
            } else {
              if ($("#selected-role").val() != "") {
//                var select = $("#modal-add-project " + "#" + $("#selected-role").val());
//                var temp = '<option value="' + response.user.uid + '">' + response.user.full_name + '</option>';
//                select.append(temp);
//                select.select2("data", {id: response.user.uid, text: response.user.full_name});
//                $("#selected-role").val("");
                setTimeout(function() {
                  $("#modal-add-project").modal('hide');
                }, 1500);
              }
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

  //User select to go to menu -> check select project
  $(".main-nav li[id!='project']").click(function(event) {
    var link = $(this).attr("id");
    $.ajax({
      url: "/project/check_current",
      type: "GET",
      success: function(response) {
        if (response.status === 200) {
          window.location = "/" + link;
        } else {
          $("#modal-error-notice .error-content").html(response.message);
          $("#modal-error-notice").modal('show');
        }
      }
    });
    event.preventDefault();
  });

  //Close modal -> destroy task-datatables
  $("#modal-edit-story").on("hidden", function() {
    var oTable = $("#task-datatable").dataTable();
    oTable.fnDestroy();
    $("#modal-edit-story #task-datatable tbody").html("");
  });

  //Add story form
  $("#form-add-story").submit(function(event) {
    if ($(this).valid() === true) {
      $.ajax({
        url: "/story/add",
        type: "POST",
        data: $(this).serialize(),
        success: function(response) {
          if (response.status === 800) { //error
            showAlert(0, true, response.message);
          } else if (response.status === 200) {
            appendStoryToHTML("sprint_page_left");
            showAlert(1, true, response.message);
            setTimeout(function() {
              $("#modal-add-story").modal('hide');
            }, 1500);
            clearFormInput("#form-add-story");
          }
        }
      });
    }
    event.preventDefault();
  });

  //Edit story form
  $("#modal-edit-story").on("submit", "#form-edit-story", function(e) {
    e.preventDefault();
    if ($(this).valid() === true) {
      $.ajax({
        url: "/story/save",
        type: "POST",
        data: $(this).serialize(),
        success: function(response) {
          if (response.status === 200) {
            showAlert(1, true, response.message);
            appendStoryToHTML(window.story_locate);
            setTimeout(function() {
              $("#modal-edit-story").modal("hide");
            }, 1500);
            clearFormInput("#form-edit-story");
          } else if (response.status === 200) {
            showAlert(0, true, response.message);
          }
        }
      });
    }
  });

});


//Submit add task form
//$("#form-add-task").submit(function(e) {
$(document).on("submit", "#form-add-task", function(e) {
  e.preventDefault();
  $("#form-add-task").unbind('submit');
  if ($(this).valid() === true) {
    $("#form-add-task input:submit").attr("disabled", "disabled");
    var data = $(this).serialize();
    data += "&sid=" + window.current_story;
    $.ajax({
      url: "/task/add",
      type: "POST",
      data: data,
      success: function(response) {
        if (response.status === 200) {
          showAlert(1, true, response.message);
          setTimeout(function() {
            $("#modal-add-task").modal('hide');
          }, 1000);
          var oTable = $("#task-datatable").dataTable();
          oTable.fnReloadAjax();
          clearFormInput("#form-add-task");
        }
      }
    });
  }
  return false;
});


function loadTask(taid) {
  $('body').modalmanager('loading');
  $.ajax({
    url: "/task/edit",
    type: "POST",
    data: {taid: taid},
    global: false,
    success: function(response) {
      if (response.status === 200) {
        var parent = "#modal-edit-task #form-edit-task ";
        var task_info = response.task_info;
//        console.log(task_info);
        $(parent + "#taid").val(task_info.taid);
        $(parent + "#name").val(task_info.name);
        $(parent + "#time_estimate").val(task_info.time_estimate);
        $(parent + "#create_date").val(task_info.create_date);
        $(parent + "#create_user").val(task_info.user_name);
        $(parent + "#time_remain").val(task_info.time_remain);
        if (task_info.status == 1) {
          $(parent + "#time_remain").attr("disabled", "disabled");
        } else {
          $(parent + "#time_remain").removeAttr("disabled");
        }
        switch (task_info.status) {
          case 1:
            $(parent + "#status").val("To do");
            break;
          case 2:
            $(parent + "#status").val("In progress");
            break;
          case 3:
            $(parent + "#status").val("To test");
            break;
          case 4:
            $(parent + "#status").val("Done");
            break;
        }
        $(parent + "#description").val(task_info.description);
        if (task_info.assign === 0) {
          $(parent + "#uid").attr("disabled", "disabled");
        } else {
          $(parent + "#uid").removeAttr("disabled");
          //$(parent + "#uid").attr("data-rule-required", "true");
          var html = '<option value=""></option>';
          $.each(response.user_in_team, function(key, value) {
            html += '<option value="' + value.uid + '">' + value.fullname + '</option>';
          });
          $(parent + "#uid").html(html);
          $(parent + "#uid").val(task_info.uid);
        }
        //comment
        var comment = response.comment;
        getComment("#modal-edit-task", taid, comment);
        getActivity("#modal-edit-task", 6, taid, 0, 10);
        $("#form-add-task input:submit").attr("disabled", false);
        $("#modal-edit-task").modal('show');
      }
    },
    error: function(response) {
      var err = jQuery.parseJSON(response.responseText);
      $("#modal-error-notice .error-content").html(err.error.message);
      $("#modal-error-notice").modal('show');
    }
  });
}

/**
 * View a task in modal edit story
 */
$(document).on("click", ".view_task", function(e) {
  e.preventDefault();
  var taid = $(this).attr("href");
  loadTask(taid);
});

//Submit form edit task
//$("#form-edit-task").submit(function(e) {
$(document).on("submit", "#form-edit-task", function(e) {
  e.preventDefault();
  //$("#form-edit-task input:submit").attr("disabled", "disabled");
  //$("#form-edit-task").unbind('submit');
  $(this).unbind('submit');
  $(this).find("input:submit").attr("disabled", true);
  if ($(this).valid() === true) {
    var data = $(this).serialize();
    var has_user = false;
    var taid = $("#form-edit-task #taid").val();
    if ($("#form-edit-task #uid").val() !== "") {
      has_user = true;
    }
    $.ajax({
      url: "/task/save",
      type: "POST",
      data: data,
      success: function(response) {
        if (response.status === 200) {
          showAlert(1, true, response.message);
          setTimeout(function() {
            $("#modal-edit-task").modal('hide');
          }, 1000);
          var page = $(location).attr('pathname');
          //Make change to HTML
          if (page.indexOf("taskboard") !== -1) {
            var sid = $("#task_" + taid).attr("data-current-sid");
            appendTaskToHTML(taid, has_user, sid);
          } else {
            appendTaskToHTML(taid, has_user);
          }
          setTimeout(function() {
            clearFormInput("#form-edit-task");
          }, 1000);
        }
      }, complete: function() {
        $("#form-edit-task input:submit").attr("disabled", false);
      }
    });
  }
  return false;
});

function appendTaskToHTML(taid, has_user, sid) {
  var page = $(location).attr('pathname');
  if (page === "/story" || page === "/sprint") {
    var oTable = $("#task-datatable").dataTable();
    oTable.fnReloadAjax();
  } else {
    if (has_user === true) {
      $("#task_" + taid).removeClass("task-item-unsortabled");
      $("#task_" + taid).addClass("task-item");
    }
    $("#task_" + taid).html("");
    $("#story_" + sid + " .story-description .story-progress").html("");
    $("#story_" + sid + " .story-description .story-progress").load("/task/reload_story_progress/" + sid);
    $("#task_" + taid).load("/task/reload_task_detail/" + taid);
  }
}

/**
 * When submit edit sotry succesfully
 * @returns {undefined}
 */
function appendStoryToHTML(locate) {
  var page = $(location).attr('pathname');
//  console.log(locate);
//  console.log(page);
  if (page === "/story") {
    var oTable = $("#user-story-datatable").dataTable();
    oTable.fnReloadAjax();
  } else if (page === '/sprint') {
    if (locate === "sprint_page_right") {
      $("#story-not-se-list .box-content").html("");
      $("#story-not-se-list .box-content").load("/sprint/reload_story_list");
    } else if (page === "sprint_page_left") {

    }
    else {
      location.reload();
    }
  }
}

/**
 * 
 * @returns {undefined}
 */
function initTaskDatatable(sid) {
  var sAjaxSource = "/task/get_datatables/" + sid + "/";
  var opt = {
    "sAjaxSource": sAjaxSource,
    "sDom": "<'row-fluid well-search'<'span5'Ti><'span2'f><'span5'p><'clear'><'container-processing'r>>t<'row-fluid'<'span6'i><'span6'p>>",
    "sPaginationType": "full_numbers",
    "oLanguage": {
      "sSearch": "<span>Search:</span> ",
      "sInfo": "Showing <span>_START_</span> to <span>_END_</span> of <span>_TOTAL_</span> entries",
      "sLengthMenu": "_MENU_ <span>entries per page</span>"
    },
    "aoColumns": [
      {"mData": "name"},
      {"mData": "time_estimate"},
      {"mData": "status"},
      {"mData": "create_date"},
      {"mData": "create_user"},
      {"mData": "description"},
      {"mData": "assign"},
      {"mData": "taid"}
    ],
    'aoColumnDefs': [
      {
        'bSortable': false,
        'aTargets': [7]
      },
      {
        "mRender": function(data, type, row) {
          switch (row["status"]) {
            case 1:
              return "To do";
              break;
            case 2:
              return "In progress";
              break;
            case 3:
              return "To test";
              break;
            case 4:
              return "Done";
              break;
          }
        },
        'aTargets': [2]
      },
      {
        "mRender": function(data, type, row) {
          $html = '<div id="task_' + row['taid'] + '_ac"><a href="' + row['taid'] + '" class="btn view_task" rel="tooltip" title="View"><i class="icon-edit"></i></a>'
                  + '</div>';
          return $html;
        },
        'aTargets': [7]
      }
    ],
    "oLanguage": {
      "sLengthMenu": "_MENU_",
      "sInfo": "Showing _START_ to _END_ of _TOTAL_ entries <span class='selected_rows'></span>",
      "sSearch": "",
      "oPaginate": {
        "sNext": "Next",
        "sPrevious": "Previous",
      },
      "sEmptyTable": "No data available in table",
      "sInfoEmpty": "Showing 0 to 0 of 0 entries",
      "sInfoFiltered": "(filtered from _MAX_ total entries)",
      "sLoadingRecords": "Loading...",
      "sProcessing": "<i class='icon-spinner icon-spin icon-large'></i> Processing..."
    },
    'oColVis': {
      "buttonText": "Change columns <i class='icon-angle-down'></i>"
    },
    'oTableTools': {
      //"sRowSelect": "single",
      "aButtons": [],
      //"sSelectedClass": 'row_selected',
    }
  };
  oTable = $('#task-datatable').dataTable(opt);

  $('.dataTables_filter input').attr("placeholder", "Search here...");
  $(".dataTables_length select").wrap("<div class='input-mini'></div>").chosen({
    disable_search_threshold: 9999999
  });
  // $("#check_all").click(function(e){
  // 	$('input', oTable.fnGetNodes()).prop('checked',this.checked);
  // });
  $.datepicker.setDefaults({
    dateFormat: "dd-mm-yy"
  });
  oTable.columnFilter({
    "sPlaceHolder": "head:after",
    'aoColumns': [
      {
        type: "text",
      },
      {
        type: "text",
      },
      {
        type: "select",
        bCaseSensitive: false,
        values: ['To do', 'In progress', 'To test', 'Done']
      },
      {
        type: "date-range",
        sRangeFormat: "{from} {to}",
      },
      {
        type: "text",
      },
      {
        type: "text",
      },
      {
        type: "text",
      },
      null
    ]
  });
  $("#task-datatable").css("width", '100%');
  $('table#task-datatable > thead > tr:last-child').hide();

  var html = '<button id="task_advanced_filter" class="advance-filter mr10 pull-right"><i class="icon-filter"></i></button>';
  $('#task-datatable_wrapper > div.well-search > div:nth-child(3)').prepend(html);

  $('#task_advanced_filter').click(function() {
    $('table#task-datatable > thead > tr:last-child').toggle();
    if ($('#task_advanced_filter').hasClass('advance-filter-active')) {
      $('#task_advanced_filter').removeClass('advance-filter-active');
      // reset_dt_view(oTable);
    } else {
      $('#task_advanced_filter').addClass('advance-filter-active');
    }
  });
}

/**
 * Only show loading to specific HTML element
 * @param {type} wrapper
 * @returns {undefined}
 */
function showLoading(wrapper) {
  if (typeof wrapper != "undefined") {
    $(wrapper + " .loader").show();
  } else {
    $(".loader").show();
  }
}

function getActivity(selector, entity_type, entity_id, offset, limit) {
  $(selector + " .tab-activity .load-more-activity").css("display", "block");
  $.ajax({
    url: "/activity/get",
    type: "POST",
    data: {entity_type: entity_type, entity_id: entity_id, offset: offset, limit: limit},
    success: function(response) {
//      console.log(response);
      var act_list = response;
      var act_temp = selector + " .tab-activity .activity-temp";
      $(selector + " .tab-activity .timeline").html("");
      var count = 0;
      $.each(act_list, function(key, act) {
        $(act_temp + " .img-user-info").attr("src", "data/image/user/" + act.user_image);
        $(act_temp + " .activity-text").html(act.text);
        $(act_temp + " .activity-time").html(act.time);
        $(selector + " .tab-activity .timeline").append($(act_temp).html());
        count++;
      });
      if (count < 10) {
        $(selector + " .tab-activity .load-more-activity").css("display", "none");
      } else {
        $(selector + " .tab-activity .load-more-activity").attr("data-selector", selector);
        $(selector + " .tab-activity .load-more-activity").attr("data-entity-type", entity_type);
        $(selector + " .tab-activity .load-more-activity").attr("data-entity-id", entity_id);
        $(selector + " .tab-activity .load-more-activity").attr("data-offset", offset + 10);
        $(selector + " .tab-activity .load-more-activity").attr("data-limit", limit + 10);
      }

    }
  });
}

function getMoreActivity(selector, entity_type, entity_id, offset, limit) {
  $.ajax({
    url: "/activity/get",
    type: "POST",
    data: {entity_type: entity_type, entity_id: entity_id, offset: offset, limit: limit},
    success: function(response) {
      var act_list = response;
      var act_temp = selector + " .tab-activity .activity-temp";
//      $(selector + " .tab-activity .timeline").html("");
      var count = 0;
      $.each(act_list, function(key, act) {
        $(act_temp + " .img-user-info").attr("src", "data/image/user/" + act.user_image);
        $(act_temp + " .activity-text").html(act.text);
        $(act_temp + " .activity-time").html(act.time);
        $(selector + " .tab-activity .timeline").append($(act_temp).html());
        count++;
      });
      if (count < 10) {
        $(selector + " .tab-activity .load-more-activity").css("display", "none");
      } else {
        $(selector + " .tab-activity .load-more-activity").attr("data-selector", selector);
        $(selector + " .tab-activity .load-more-activity").attr("data-entity-type", entity_type);
        $(selector + " .tab-activity .load-more-activity").attr("data-entity-id", entity_id);
        $(selector + " .tab-activity .load-more-activity").attr("data-offset", offset + 10);
        $(selector + " .tab-activity .load-more-activity").attr("data-limit", limit + 10);
      }
    }
  });
}

$(document).on("click", ".load-more-activity", function(e) {
  e.preventDefault();
  var selector = $(this).attr("data-selector");
  var entity_type = $(this).attr("data-entity-type");
  var entity_id = $(this).attr("data-entity-id");
  var offset = $(this).attr("data-offset");
  var limit = $(this).attr("data-limit");
  getMoreActivity(selector, entity_type, entity_id, offset, limit);
});

$(".tab-activity").on("click", ".user", function(e) {
  e.preventDefault();
});

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

function showGlLoad() {
  if ($(".global-loading").css("display") == "none") {
    $(".global-loading").css("display", "inline");
  }
}

function hideGlLoad() {
  if ($(".global-loading").css("display") == "inline") {
    $(".global-loading").css("display", "none");
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

function showAlertModal(message) {
  $("#modal-error-notice .error-content").html(message);
  $("#modal-error-notice").modal('show');
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

function editStorySubmit(sid) {
  $('body').modalmanager('loading');
  window.current_story = sid;
  $.ajax({
    url: "/story/edit",
    type: "POST",
    data: {sid: sid},
    global: false,
    success: function(response) {
      if (response.status === 200) {
        initTaskDatatable(sid);
        var parent = "#modal-edit-story #form-edit-story";
        var story_info = response.story_info;
        $(parent + " #sid").val(story_info.sid);
        $(parent + " #name").val(story_info.name);
        $(parent + " #priority").val(story_info.priority);
        $(parent + " #status").val(story_info.status);
        $(parent + " #time_estimate").val(story_info.time_estimate);
        $(parent + " #create_user").val(story_info.create_user);
        $(parent + " #point").val(story_info.point);
        $(parent + " #demo").val(story_info.demo);
        $(parent + " #description").val(story_info.description);
        $(parent + " .approve-story").attr("data-sid", story_info.sid);
        $(parent + " .approve-story").attr("data-status", story_info.status);
        $(parent + " .delete-story").attr("data-sid", story_info.sid);
        if (story_info.status > 1) {
          $(parent + " .approve-story").css("display", "none");
        } else {
          $(parent + " .approve-story").css("display", "inline");
        }
        //comment info
        var comment = response.comment;
        getComment("#modal-edit-story", sid, comment);
        getActivity("#modal-edit-story", 2, sid, 0, 10);

        $("#modal-edit-story").modal("show");
      }
    }
  });
}