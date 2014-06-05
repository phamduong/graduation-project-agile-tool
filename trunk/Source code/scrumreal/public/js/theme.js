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

  //Submit add task form
  $("#form-add-task").submit(function(e) {
    $("#form-add-task input:submit").attr("disabled", "disabled");
    e.preventDefault();
    if ($(this).valid() === true) {
      var data = $(this).serialize();
      data += "&sid=" + window.current_story;
      $.ajax({
        url: "task/add",
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
  });


  //Close modal -> destroy task-datatables
  $("#modal-edit-story").on("hidden", function() {
    var oTable = $("#task-datatable").dataTable();
    oTable.fnDestroy();
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

/**
 * When submit edit sotry succesfully
 * @returns {undefined}
 */
function appendStoryToHTML(locate) {
  var page = $(location).attr('pathname');
//  console.log(locate);
//  console.log(page);
  if (page === '/story') {
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
          $html = '<div id="task_' + row['taid'] + '_ac"><a href="' + row['taid'] + '" class="btn view_story" rel="tooltip" title="View"><i class="icon-edit"></i></a>'
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
  $('div.dataTables_wrapper > div.well-search > div:nth-child(3)').prepend(html);
  
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
    url: "story/edit",
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
        if (story_info.status > 1) {
          $(parent + " .approve-story").css("display", "none");
        }
        //comment info
        var comment = response.comment;
        getComment("#modal-edit-story", sid, comment);
        $("#modal-edit-story").modal("show");
      }
    }
  });
}