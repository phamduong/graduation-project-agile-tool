var current_sid;
var taskTable;

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
          if (checkPermission("/" + link) == true) {
            window.location = "/" + link;
          } else {

          }

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
    oTable.fnClearTable();
    //oTable.fnDestroy();
    //$("#modal-edit-story #task-datatable tbody").html("");
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

$(".attach-files").on("click", "a", function(e) {
  e.preventDefault();
  var href = $(this).attr("href");
//  var filename = $(this).html();
//  var url = "/attach/download_file/" + filename + "/" + href;
  window.location.assign(href);
});

$(document).on("click", ".remove_attach", function(e) {
  e.preventDefault();
  $(this).parent().css("display", "none");
});
