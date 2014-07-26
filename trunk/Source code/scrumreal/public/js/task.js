var story_status = {};
story_status[1] = "New";
story_status[2] = "Approved";
story_status[3] = "Estimated";
story_status[4] = "Assigned";
story_status[5] = "To do";
story_status[6] = "In progress";
story_status[7] = "To test";
story_status[8] = "Done";
story_status[9] = "Sprint completed";

function updateStoryHTML(story_data) {
  var sid = story_data.sid;
  $("#story_" + sid + " .story-point").html('<i class="icon-user"></i>' + story_data.point);
  $("#story_" + sid + " .story-name .task_edit_story").html(story_data.name);
  $("#story_" + sid + " .story-days").html(story_data.time_estimate);
  $("#story_" + sid + " .story-status").html(story_status[story_data.status]);
}
$(document).ready(function() {
  var callback = function(topic, data) {
    if (topic === "scrum.realtime_" + current_project + ".task") {
      switch (data.type) {
        case "update_task":
          {
            var task_data = data.content.task_data;
            var has_user = false;
            if (task_data.uid != "" && task_data.uid != null) {
              has_user = true;
            }
            reloadTaskHTML(task_data.taid, has_user, task_data.sid);
            destroyTaskSortable();
            initTaskSortable();
            break;
          }
        case "delete_task":
          {
            var taid = data.content.taid;
            $("#task_" + taid).remove();
            var sid = data.content.task_data.sid;
            $("#story_" + sid + " .story-description .story-progress").load("/task/reload_story_progress/" + sid);
            caculateAllStory();
            break;
          }
        case "add_task":
          {
            appendTaskToHTML(data.content.task_data);
            var sid = data.content.task_data.sid;
            $("#story_" + sid + " .story-description .story-progress").load("/task/reload_story_progress/" + sid);
            caculateAllStory();
            destroyTaskSortable();
            initTaskSortable();
            break;
          }
        case "update_task_order":
          {
            updateTaskOrder2(data.content);
            break;
          }
        case "move_task":
          {
            var sid = data.content.task_data.sid;
            var cls = getStoryStatusClass(data.content.new_status);
            var taid = data.content.taid;
            if ($("#story_" + sid + " ." + cls + " #task_" + taid).length === 0) {
              appendAvailableTaskToHTML(data);
            }
            var sid = data.content.task_data.sid;
            $("#story_" + sid + " .story-description .story-progress").load("/task/reload_story_progress/" + sid);
            break;
          }
      }
    } else if (topic === "scrum.realtime_" + current_project + ".story") {
      switch (data.type) {
        case "update":
          {
            updateStoryHTML(data.content);
            var sid = data.content.sid;
            $("#story_" + sid + " .story-description .story-progress").load("/task/reload_story_progress/" + sid);
            break;
          }
      }
    } else if (topic === "scrum.realtime_" + current_project + ".sprint") {
//      switch (data.type) {
//        
//      }
    }
  };

  var link = ["scrum.realtime_" + current_project + ".task",
    "scrum.realtime_" + current_project + ".story",
    "scrum.realtime_" + current_project + ".sprint"];
  subscribeToTopic(link, "localhost", "8080", callback);

  initTaskSortable();

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

});

function destroyTaskSortable() {
  $(".task-box").each(function() {
    if ($(this).data("uiSortable")) {
      $(this).sortable("destroy");
    }
  });
}

function initTaskSortable() {
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
      var sid = item.attr("data-current-sid");
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
          async: false,
          data: {taid: taid, old_status: window.start_col, status: end_col},
          success: function(response) {
            var story_data = response.story;
            $("#story_" + story_data.sid + " .story-status").html(story_data.status);
            $("#story_" + window.start_sid_task + " .story-description .story-progress").html("");
            $("#story_" + window.start_sid_task + " .story-description .story-progress").load("/task/reload_story_progress/" + window.start_sid_task);
            updateStoryOrder(sid, end_col);
          },
          error: function(response) {
            showAlertModal(response.message);
          }
        });
      }
      //else update task item order
      else {
        updateStoryOrder(sid, end_col);
      }
    }
  }).disableSelection();
}

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
      var parent_id = $(this).parent().attr("id");
      $("#" + parent_id + " .story-tasks .task-box").each(function() {
        if ($(this).height() > max_height) {
          $(this).height(max_height);
        }
      });
    }
  });
}

function updateStoryOrder(sid, status) {
  var count = 0;
  var cls = getStoryStatusClass(status);
  var data = {};
  $("#story_" + sid + " ." + cls + " .task-ta").each(function() {
    if (typeof $(this).attr("id") != "undefined") {
      count++;
      $(this).attr("data-order", count);
      data[$(this).attr("data-taid")] = $(this).attr("data-order");
    }
  });
  if (count > 0) {
    $.ajax({
      url: "/task/update_order",
      type: "POST",
      async: false,
      data: {data: data, sid: sid, status: status},
      success: function() {

      }
    });
  }
}

function sortTaskByOrder(a, b) {
  var v1 = a.getAttribute("data-order");
  var v2 = b.getAttribute("data-order");
  return v1 > v2;
}

function getStoryStatusClass(status) {
  var cls = "";
  switch (status) {
    case "1":
      {
        cls = "to-do-tasks";
        break;
      }
    case "2":
      {
        cls = "in-progress-tasks";
        break;
      }
    case "3":
      {
        cls = "to-test-tasks";
        break;
      }
    case "4":
      {
        cls = "done-tasks";
        break;
      }
  }
  return cls;
}

function updateTaskOrder2(data) {
  var sid = data.sid;
  var status = data.status;
  var cls = getStoryStatusClass(status);
  var list_taid = data.list_taid;
  $.each(list_taid, function(key, val) {
    $("#story_" + sid + " ." + cls + " #task_" + key).attr("data-order", val);
  });
  var list = $("#story_" + sid + " ." + cls + " .task-ta").get();
  list.sort(sortTaskByOrder);
  for (var i = 0; i < list.length; i++) {
    list[i].parentNode.appendChild(list[i]);
  }
}

function appendTaskToHTML(task_data) {
  var task_temp = $(".task-temp").html();
  $(".task-temp .task-item-unsortabled").attr("data-taid", task_data.taid);
  $(".task-temp .task-item-unsortabled").attr("id", "task_" + task_data.taid);
  $(".task-temp .task-item-unsortabled").attr("data-current-sid", task_data.sid);
  $(".task-temp .task-name a").attr("href", task_data.taid);
  $(".task-temp .task-name a").html(task_data.name);
  if (task_data.user_id != null && task_data.user_id != "") {
    var user_info = '<img alt="" class="taskboard-user-image" src="' + task_data.user_image_path + '">';
    user_info += '<p class="task-assign-name">' + task_data.user_name + '</p>';
    $(".task-temp .span4").append(user_info);
  }
  $(".task-temp .badge-info").html(task_data.time_estimate + " d");
  $(".task-temp .bar").css("width", task_data.progress + "%");
  $(".task-temp .bar").html(task_data.progress + "%");
  $("#story_" + task_data.sid + " .to-do-tasks .task-box").append($(".task-temp").html());
//  $(".task-temp .task-item").addClass("task-item-unsortabled");
//  $(".task-temp .task-item").removeClass("task-item");
  $(".task-temp").html(task_temp);
}

function removeTaskHTML(taid) {
  $("#task_" + taid).remove();
}

function appendAvailableTaskToHTML(data) {
  var sid = data.content.task_data.sid;
  var status = data.content.new_status;
  var taid = data.content.taid;
  var html = document.getElementById("task_" + taid).outerHTML;
  var cls = getStoryStatusClass(status);
  removeTaskHTML(taid);
  $("#story_" + sid + " ." + cls + " .task-box").append(html);
  //update status
  if (status >= 3) {
    $("#task_" + taid + " .progress-info .bar").width("100%");
    $("#task_" + taid + " .progress-info .bar").html("100%");
  } else if (status === 1) {
    $("#task_" + taid + " .progress-info .bar").width("0%");
    $("#task_" + taid + " .progress-info .bar").html("0%");
  }
}