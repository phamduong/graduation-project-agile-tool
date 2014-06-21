$(document).ready(function() {
  // Make taskbox sortable
  $(".task-box").sortable({
    connectWith: ".task-box",
//    items: ".box-condensed",
    items: ".task-item",
    opacity: 0.7,
    placeholder: 'widget-placeholder',
    forcePlaceholderSize: true,
    tolerance: "pointer",
    dropOnEmpty: true,
    //containment: $(this).parent().parent(),
    start: function(event, ui) {
      var item = ui.helper;
      var parent = item.parent();
      window.start_col = parent.attr("data-task-status");
      window.start_sid_task = item.attr("data-current-sid");
//      console.log("start: " + parent.attr("data-task-status"));
//      console.log("task id: " + item.attr("data-taid"));
    },
    create: function(event, ui) {
      var limit = $(this).parent().parent();
      $(this).sortable("option", "containment", limit);
    },
    stop: function(event, ui) {
      caculateAllStory();
      var item = ui.item;
      var parent = item.parent();
//      console.log("stop: " + parent.attr("data-task-status"));
//      console.log("task id: " + item.attr("data-taid"));
      var taid = item.attr("data-taid");
      var end_col = parent.attr("data-task-status");
      if (end_col >= 3) {
        $("#task_" + taid + " .progress-info .bar").width("100%");
        $("#task_" + taid + " .progress-info .bar").html("100%");
      } else if (end_col === 1) {
        $("#task_" + taid + " .progress-info .bar").width("0%");
        $("#task_" + taid + " .progress-info .bar").html("0%");
      }
      if (window.start_col !== end_col) {
        $.ajax({
          url: "/task/update_status",
          type: "POST",
          data: {taid: taid, old_status: window.start_col, status: end_col},
          success: function(response) {
            var story_data = response.story;
            $("#story_" + story_data.sid + " .story-status").html(story_data.status);
            $("#story_" + window.start_sid_task + " .story-description .story-progress").html("");
            $("#story_" + window.start_sid_task + " .story-description .story-progress").load("/task/reload_story_progress/" + window.start_sid_task);
          },
          error: function(response) {
            showAlertModal(response.message);
          }
        });

      }
    }
  }).disableSelection();

  //Caculate height of stories
  caculateAllStory();

  //Select 2 me
  $("#sprint_filter").select2();
  $("#other_filter").select2({
    width: '250px'
  });

  //Choose sprint filter
  $("#sprint_filter").change(function() {
    var spid = $("#sprint_filter").select2("val");
    window.location = "/taskboard/" + spid + "/";
  });

  $("#other_filter").change(function() {
    var temp = $("#other_filter").select2("val");
    var spid = $("#sprint_filter").select2("val");
    var entity_id = temp.split("_")[0];
    var entity_type = temp.split("_")[1];
    var url = "/taskboard/" + spid + "/" + entity_type + "/" + entity_id + "/";
    window.location = url;
  });

  //Submit form edit task
  $("#form-edit-task").submit(function(e) {
    e.preventDefault();
    $("#form-edit-task input:submit").attr("disabled", "disabled");
    if ($(this).valid() === true) {
      var data = $(this).serialize();
      var has_user = false;
      var taid = $("#form-edit-task #taid").val();
      if ($("#form-edit-task #uid").val() !== "") {
        has_user = true;
      }
      var sid = $("#task_" + taid).attr("data-current-sid");
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
            appendTaskToHTML(taid, has_user, sid);
            setTimeout(function() {
              clearFormInput("#form-edit-task");
            }, 1000);
          }
        }, complete: function() {
          $("#form-edit-task input:submit").removeAttr("disabled");
        }
      });
    }
  });


});

$("#task-board").on("click", ".task_edit_task", function(e) {
  e.preventDefault();
  var taid = $(this).attr("href");
  loadTask(taid);
});

$("#task_board_filter").keyup(function() {
  alert('test');
});

$("#task-board").on("click", ".task_edit_story", function(e) {
  e.preventDefault();
  return false;
//  var sid = $(this).attr("href");
//  editStorySubmit(sid);
});


/**
 * Caculate height
 * @returns {undefined}
 */
function caculateAllStory() {
  var max_height;
  var max_length;
  $.each($("#task-board .user-story .story_info"), function() {
    max_height = 0;
    max_length = 0;
    $(this).parent().find(".story-tasks .task-box").each(function() {
      if ($(this).find(".box").length > max_length) {
        max_length = $(this).find(".box").length;
      }
//      if ($(this).height() > max_height) {
////        console.log(max_height);
////        console.log($(this).height());
//        max_height = $(this).height();
//      }
    });
    max_height = max_length * 145;
    if (max_height !== null && max_height !== 0) {
      $(this).find(".story-content").css("height", (max_height - 80));
      //Update height of all taskbox
      $(this).parent().find(".story-tasks .task-box").each(function() {
        if ($(this).height() < max_height) {
          $(this).height(max_height);
        }
      });
    }
  });
}
