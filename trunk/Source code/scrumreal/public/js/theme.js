if (!window.WebSocket) {
  alert("BROWSER DOES NOT SUPPORTED WEBSOCKET, PLEASE UPDATE YOUR BROWSER TO USE FULL FEATURES OF SCRUM TOOL!");
}

var current_sid;
var taskTable; //global object to easily reference

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
              //showAlert(0, true, err.error.message);
              showAlertModal(err.error.message);
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
//              $("#staff-list .box-content").html();
//              $("#staff-list .box-content").load("/people/reload_list_staff");
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
          showAlertModal(response.message);
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
      var fileSelect = document.getElementById('story-attach-add');
      var files = fileSelect.files;
      var len = files.length;
      var formData = new FormData();
      var ext_arr = ['jpg', 'png', 'doc', 'docx', 'xls', 'xlsx', 'pdf', 'rar', 'zip'];
      var name_err = [];
      var count_form_data_ele = 0;
      if (len > 0) {
        for (var i = 0; i < len; i++) {
          var file = files[i];
          if (checkFileExtension(file.name, ext_arr) == true) {
            formData.append('attach[]', file, file.name);
            count_form_data_ele++;
          } else {
            name_err.push(file.name);
          }
        }
      }
      if (name_err.length > 0) {
        alert("Some file extension are not valid, pls check a again: " + name_err.toString());
      } else {
        $.ajax({
          url: "/story/add",
          type: "POST",
          data: $(this).serialize(),
          success: function(response) {
            if (response.status === 800) { //error
              showAlert(0, true, response.message);
            } else if (response.status === 200) {
              if (count_form_data_ele > 0) {
                addAttach(formData, 2, response.sid);
              }
//              appendStoryToHTML("sprint_page_left");
              showAlert(1, true, response.message);
              setTimeout(function() {
                $("#modal-add-story").modal('hide');
              }, 1500);
              clearFormInput("#form-add-story");
            }
          }
        });
      }
    }
    event.preventDefault();
  });

  //Edit story form
  $("#modal-edit-story").on("submit", "#form-edit-story", function(e) {
    e.preventDefault();
    var remove_attach_name = [];
    $("#form-edit-story .attach_files .file_attach").each(function() {
      if ($(this).css("display") == "none") {
        remove_attach_name.push($(this).find("a").html());
      }
    });
    if ($(this).valid() === true) {
      var fileSelect = document.getElementById('story-attach-update');
      var files = fileSelect.files;
      var len = files.length;
      var formData = new FormData();
      var ext_arr = ['jpg', 'png', 'doc', 'docx', 'xls', 'xlsx', 'pdf', 'rar', 'zip'];
      var name_err = [];
      var count_form_data_ele = 0;
      if (len > 0) {
        for (var i = 0; i < len; i++) {
          var file = files[i];
          if (checkFileExtension(file.name, ext_arr) == true) {
            formData.append('attach[]', file, file.name);
            count_form_data_ele++;
          } else {
            name_err.push(file.name);
          }
        }
      }
      var sid = $("#form-edit-story #sid").val();
      if (name_err.length > 0) {
        alert("Some file extension are not valid, pls check a again: " + name_err.toString());
      } else {
        $.ajax({
          url: "/story/save",
          type: "POST",
          data: $(this).serialize(),
          success: function(response) {
            if (response.status == 200) {
              showAlert(1, true, response.message);

              //attach new file
              if (count_form_data_ele > 0) {
                addAttach(formData, 2, sid);
              }

              //remove old file
              if (remove_attach_name.length > 0) {
                removeAttach(remove_attach_name, 2, sid);
              }
//              appendStoryToHTML(window.story_locate);
              setTimeout(function() {
                $("#modal-edit-story").modal("hide");
              }, 1500);
              clearFormInput("#form-edit-story");
            } else if (response.status != 200) {
              showAlert(0, true, response.message);
            }
          }
        });
      }
    }
  });

  $(".attach_files").on("click", "a", function(e) {
    e.preventDefault();
    var href = $(this).attr("href");
//    var filename = $(this).html();
    window.location.assign("/download_attach/" + href);
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
//          var oTable = $("#task-datatable").dataTable();
//          oTable.fnReloadAjax();
          clearFormInput("#form-add-task");
        }
      }, complete: function() {
        $("#form-add-task input:submit").attr("disabled", false);
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
//          var page = $(location).attr('pathname');
//          //Make change to HTML
//          if (page.indexOf("taskboard") !== -1) {
//            var sid = $("#task_" + taid).attr("data-current-sid");
//            appendTaskToHTML(taid, has_user, sid);
//          } else {
//            appendTaskToHTML(taid, has_user);
//          }
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

$(document).on("click", ".remove_attach", function(e) {
  e.preventDefault();
  $(this).parent().css("display", "none");
});


$(document).on("click", ".delete-task", function(e) {
  e.preventDefault();
  var taid = $(this).attr("data-taid");
  bootbox.confirm("Are you sure you want to delete this task?", function(result) {
    if (result === true) {
      $.ajax({
        url: "/task/delete",
        type: "POST",
        data: {taid: taid},
        success: function(response) {
          if (response.status == 200) {
            var page = $(location).attr('pathname');

            setTimeout(function() {
              $("#modal-edit-task").modal('hide');
            }, 1000);

            //check if page taskboard
//            if (page.indexOf("taskboard") !== -1) {
//              $("#task_" + taid).remove();
//              caculateAllStory();
//            } else {
            //if in story page -> reload task datatable
//              taskTable.fnReloadAjax("/task/get_datatables/" + window.current_story + "/");
            //refer to window object
//            }
            showAlertModal(response.message, "success");
          } else {
            showAlertModal(response.message);
          }
        }
      });
    }
  });
});

//Delete user
$(document).on("click", '.delete-user', function(e) {
  e.preventDefault();
  var uid = $(this).attr("data-uid");
  bootbox.confirm("Are you sure you want to delete this user?", function(result) {
    if (result === true) {
      $.ajax({
        url: "/user/delete",
        type: "POST",
        data: {uid: uid},
        success: function(response) {
          if (response.status === 200) {
            setTimeout(function() {
              $("#modal-edit-user").modal("hide");
            }, 1000);
              var page = $(location).attr('pathname');
              if (page === "/users") {
                var oTable = $('#users_list_datatable').dataTable();
                oTable.fnReloadAjax();
              }
          }
        }
      });
    }
  });
});