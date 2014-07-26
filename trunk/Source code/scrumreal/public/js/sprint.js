// there's the story and the release-stories
var $story_list = $(".sprint-story-list");
var $sprint_team = $(".sprint-teams .s-team");
var ele;
var parent;
var start_id; //Drag from story list
var start_tid = 0; //Drag from team
var start_spid = 0; //Drag from sprint
var select_id; //Selected story DOM'id
var select_sid; //Selected story id
var end_spid; //Drag to sprint
var end_tid; //Drag to team
var end_id;
var current_team;
var current_sprint;
var order;
var count;
var insideMain = false;

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

var sprint_status = {
  1: "Planning",
  2: "In Progress",
  3: "Completed"
};

$(document).ready(function() {
  var callback = function(topic, data) {
    if (topic === "scrum.realtime_" + current_project + ".team") {

    } else if (topic === "scrum.realtime_" + current_project + ".story") {
      switch (data.type) {
        case "approve":
          {
            appendNewStoryHTML(data.content);
            destroyStoryDragDrop();
            initStoryDragDrop();
            break;
          }
        case "update":
          {
            updateStoryHTML(data.content);
            getTeamDayAll();
            destroyStoryDragDrop();
            initStoryDragDrop();
            break;
          }
      }
    } else if (topic === "scrum.realtime_" + current_project + ".sprint") {
      switch (data.type) {
        case "update_sprint":
          {
            updateSprintHTML(data.content);
            destroyStoryDragDrop();
            initStoryDragDrop();
            break;
          }
        case "update_team_day":
          {
            updateTeamDay(data.content);
            break;
          }
        case "add_story_to":
          {
            addStoryToSprint(data.content);
            var num_day = parseInt($("#sprint_" + data.content.end_spid + " #s_team_" + data.content.end_tid).attr("data-num-day"));
            updateEachTeamDay(data.content.end_spid, data.content.end_tid, num_day);
            updateStoryHTML(data.content.story_data);
            destroyStoryDragDrop();
            initStoryDragDrop();
            break;
          }
        case "remove_story_from":
          {
            removeStoryFromSprint(data.content);
            if ($("#story-not-se-list #story_" + data.content.select_sid).length === 0) {
              appendNewStoryHTML(data.content.story_data);
            }
            var num_day = parseInt($("#sprint_" + data.content.start_spid + " #s_team_" + data.content.start_tid).attr("data-num-day"));
            updateEachTeamDay(data.content.start_spid, data.content.start_tid, num_day);
            updateStoryHTML(data.content.story_data);
            destroyStoryDragDrop();
            initStoryDragDrop();
            break;
          }
        case "move_story":
          {
            removeStoryFromSprint(data.content);
            var num_day = parseInt($("#sprint_" + data.content.start_spid + " #s_team_" + data.content.start_tid).attr("data-num-day"));
            updateEachTeamDay(data.content.start_spid, data.content.start_tid, num_day);
            addStoryToSprint(data.content);
            var num_day = parseInt($("#sprint_" + data.content.end_spid + " #s_team_" + data.content.end_tid).attr("data-num-day"));
            updateEachTeamDay(data.content.end_spid, data.content.end_tid, num_day);
            destroyStoryDragDrop();
            initStoryDragDrop();
            break;
          }
        case "update_story_order":
          {
            updateStoryOrder2(data.content);
            break;
          }
        case "complete_sprint":
          {
            var sid = data.content.spid;
            $("#sprint_" + sid).attr("data-sprint-status", data.content.sprint_status);
            updateAllSprintStatus(data.content);
            destroyStoryDragDrop();
            removeUncompletedStoryHTML(data.content);
            getTeamDayAll();
            initStoryDragDrop();
            break;
          }
        case "resume_sprint":
          {
            var sid = data.content.spid;
            $("#sprint_" + sid).attr("data-sprint-status", data.content.sprint_status);
            updateAllSprintStatus(data.content);
            resumeSprintHTML(data.content);
            getTeamDayAll();
            destroyStoryDragDrop();
            initStoryDragDrop();
            break;
          }
        case "start_sprint":
          {
            var sid = data.content.spid;
            $("#sprint_" + sid).attr("data-sprint-status", data.content.sprint_status);
            updateAllSprintStatus(data.content);
            break;
          }
        case "add_sprint":
          {
            appendSprintHTML(data.content);
            getTeamDayAll();
            destroyStoryDragDrop();
            initStoryDragDrop();
            break;
          }
        case "delete_sprint":
          {
            deleteSprintHTML(data.content.spid);
            destroyStoryDragDrop();
            initStoryDragDrop();
            break;
          }
      }
    } else if (topic === "scrum.realtime_" + current_project + ".task") {
      switch (data.type) {
        case "update_task":
        case "delete_task":
        case "add_task":
          {
//            var table = $.fn.dataTable.fnTables(true);
//            var t = table.length;
            if (taskTable !== "undefined") {
              if ($("#modal-edit-story").hasClass("in")) {
                taskTable.fnReloadAjax();
              }
            }
            break;
          }
      }
    }
  };

  var link = ["scrum.realtime_" + current_project + ".team",
    "scrum.realtime_" + current_project + ".story",
    "scrum.realtime_" + current_project + ".sprint",
    "scrum.realtime_" + current_project + ".task"];
  subscribeToTopic(link, "localhost", "8080", callback);

  //Show number of days for each team in sprint
  getTeamDayAll();

  //Init dragable and dropable
  initStoryDragDrop();
  //Add new sprint
  $("#form-add-sprint").submit(function(event) {
    event.preventDefault();
    if ($(this).valid() === true) {
      $.ajax({
        url: "sprint/add",
        type: "POST",
        data: $(this).serialize(),
        success: function(response) {
          if (response.status !== 200) { //error
            showAlertModal(response.message, "error");
          } else if (response.status === 200) {
            showAlert(1, true, response.message);
            setTimeout(function() {
              $("#modal-add-sprint").modal('hide');
            }, 1000);
            clearFormInput("#form-add-sprint");
//            clearFormInput("#form-add-sprint");
          }
        }
      });
    }
  });

  $("#form-edit-sprint").submit(function(e) {
    e.preventDefault();
    if ($(this).valid() === true) {
      $.ajax({
        url: "sprint/save",
        type: "POST",
        data: $(this).serialize(),
        success: function(response) {
          if (response.status === 800) { //error
            showAlert(0, true, response.message);
          } else if (response.status === 200) {
            showAlert(1, true, response.message);
            setTimeout(function() {
              $("#modal-edit-sprint").modal('hide');
            }, 1000);
//            clearFormInput("#form-add-sprint");
          }
        }
      });
    }
  });

  //Edit sprint
  $("#sprint-team-list").on("click", ".sprint-name", function(event) {
    event.preventDefault();
    $('body').modalmanager('loading');
    var spid = $(this).attr("href");
    $.ajax({
      url: "sprint/edit",
      type: "POST",
      data: {spid: spid},
      global: false,
      success: function(response) {
        if (response.status === 200) {
          var parent = "#modal-edit-sprint #form-edit-sprint ";
          var sprint_info = response.sprint_info;
          $(parent + "#spid").val(sprint_info.spid);
          $(parent + "#name").val(sprint_info.name);
          $(parent + "#sprint_time").val(sprint_info.start_date_es + " - " + sprint_info.end_date_es);
//          $(parent + "#sprint_time").daterangepicker();
          $(parent + "#sprint_time").data('daterangepicker').setStartDate(sprint_info.start_date_es);
          $(parent + "#sprint_time").data('daterangepicker').setEndDate(sprint_info.end_date_es);

          $(parent + "#description").val(sprint_info.description);
          $(parent + ".delete-sprint").attr("data-spid", sprint_info.spid);
          //comment
          var comment = response.comment;
          getComment("#modal-edit-sprint", spid, comment);
          //Get activity
          getActivity("#modal-edit-sprint", 4, spid, 0, 10);

          $("#modal-edit-sprint").modal('show');
        }
      },
      error: function(response) {
        var err = jQuery.parseJSON(response.responseText);
        showAlertModal(err.error.message);
//        $("#modal-error-notice .error-content").html(err.error.message);
//        $("#modal-error-notice").modal('show');
      }
    });
  });


  $("#sprint-team-list").on("click", ".edit-story", function(e) {
    window.story_locate = "sprint_page_left";
    e.preventDefault();
    var sid = $(this).attr("href");
    editStorySubmit(sid);
  });

  //Edit story in story list
  $("#story-not-se-list").on("click", ".edit-story", function(e) {
    window.story_locate = "sprint_page_right";
    e.preventDefault();
    var sid = $(this).attr("href");
    editStorySubmit(sid);
  });
});

function sortStoryList() {
  var list_story_sortable = $(".sprint-story-list .scrollable");
  var list_story = $(".story", list_story_sortable);
  list_story.sort(function(a, b) {
    var str1 = a.getAttribute("data-name").toUpperCase().trim();
    var str2 = b.getAttribute("data-name").toUpperCase().trim();
    var r = str1.localeCompare(str2);
    return r;
  });
  list_story_sortable.append(list_story);
}

function initStoryDragDrop() {
  //sort list story
//  $(".sprint-teams .s-team .s-team-story").sortable({
//    connectWith: ".s-team-story",
//    items: ".story",
//    opacity: 0.7,
//    placeholder: 'widget-placeholder',
//    forcePlaceholderSize: true,
//    tolerance: "pointer",
//    dropOnEmpty: true,
//    revert: true
//  });

  // let the story items be draggable
  $(".sprint-story-list .story-addable").draggable({
    cancel: "a.ui-icon", // clicking an icon won't initiate dragging
    revert: "invalid", // when not dropped, the item will revert back to its initial position
    containment: "document",
    helper: "clone",
    cursor: "move",
    start: function(event, ui) {
      ele = ui.helper;
      parent = ele.parent().parent().parent();
      start_spid = 0;
      start_tid = 0;
      if (parent.hasClass("sprint-story-list")) { //Drag from story list
        select_id = "story_" + ele.attr("data-sid");
        start_id = "story-not-se-list";
      } else {  //Drag from team in sprint list
        parent = ele.parent();
        start_tid = parent.attr("data-tid");
        start_spid = parent.parent().attr("data-spid");
        select_id = "story_" + ele.attr("data-sid");
        //start from team ?, from sprint ?
        start_id = "sprint_" + start_spid + " #s_team_" + start_tid;
        //start_id = parent.attr("id"); 
      }
    }
  });

  $(".sprint-teams .story").draggable({
    cancel: "a.ui-icon", // clicking an icon won't initiate dragging
    revert: "invalid", // when not dropped, the item will revert back to its initial position
    containment: "document",
    helper: "clone",
    cursor: "move",
    start: function(event, ui) {
      ele = ui.helper;
      parent = ele.parent();
      if (parent.hasClass("s-team")) {//Drag from team 
        start_tid = parent.attr("data-tid");
        start_spid = parent.parent().attr("data-spid");
        select_id = "story_" + ele.attr("data-sid");
        start_id = "sprint_" + start_spid + " #s_team_" + start_tid;
//        start_id = parent.attr("id");
      } else {  //Drag from story list
        parent = ele.parent().parent().parent();
        select_id = "story_" + ele.attr("data-sid");
        start_id = "story-not-se-list";
      }
    },
    stop: function() {
      if (end_id !== "story-not-se-list") {
        updateStoryOrder(end_id);
      }
      //Update story data-order on draged team
      if (start_id !== "story-not-se-list" && end_id !== start_id) {
        updateStoryOrder(start_id);
      }
    }
  });

  $(".sprint-teams .s-team").droppable({
    accept: ".story",
//    activeClass: "ui-state-highlight",
    drop: function(event, ui) {
      $(this).append(ui.draggable);
      //If not drag and drop on the same team
//      console.log("start_id: " + start_id + " --- select_id: " + select_id);
      if ($("#" + start_id).find("#" + select_id).length == 0) {
        select_sid = $("#" + select_id).attr("data-sid");
        ele = ui.draggable;
        parent = ele.parent();
        end_tid = parent.attr("data-tid");
        end_spid = parent.parent().attr("data-spid");
        //Order
        order = $("#" + select_id).attr("data-order");
        if (start_tid == 0 && start_spid == 0) { //If add story to sprint from story list
          console.log("insideMain: " + insideMain);
          console.log("start_id: " + start_id + " select_id: " + select_id);
          console.log("add: " + select_sid + " to team :" + end_tid + " ,sprint: " + end_spid);
          //Send ajax request
          addToSprint(select_sid, end_spid, end_tid, order);

        } else {
          console.log("add: " + select_sid + " to team :" + end_tid + " ,sprint: " + end_spid + " from team: " + start_tid + " from sprint: " + start_spid);
          //Send ajax request
          moveToSprint(select_sid, start_spid, start_tid, end_spid, end_tid, order);

        }
      }
      //Update story data order on droped team
      ele = ui.draggable;
      parent = ele.parent();
      current_team = parent.attr("id");
      current_sprint = "sprint_" + parent.parent().attr("data-spid");
      end_id = current_sprint + " #" + current_team;

      /*****IMPORTANT****/
      insideMain = false;
    },
    accept: function() {
      return insideMain;
    }
  });

  $(".sprint-story-list").droppable({
    accept: ".story",
    // activeClass: "custom-state-active",
    drop: function(event, ui) {
      $(this).find(".scrollable").append(ui.draggable);
      if ($("#" + start_id).find("#" + select_id).length == 0) {
        select_sid = $("#" + select_id).attr("data-sid");
        console.log("Drop story: " + select_sid + " to story list from team: " + start_tid + " ,from sprint: " + start_spid);
        removeFromSprint(select_sid, start_spid, start_tid);

        start_tid = 0;
        start_spid = 0;
      }
      sortStoryList();
//      $(".story-list .scrollable").sortable("refresh");
    }
  });

  //In case drag over an hidden team
  $(".sprint-teams").droppable({
    over: function() {
      insideMain = true;
    },
    out: function() {
      insideMain = false;
    }
  });

  //SORT by story name
  sortStoryList();
}

function addToSprint(select_sid, end_spid, end_tid, order) {
  showGlLoad();
  $.ajax({
    url: 'sprint/add_story_to_sprint',
    type: 'POST',
    global: false,
    data: {select_sid: select_sid, end_spid: end_spid,
      end_tid: end_tid, order: order},
    success: function(response) {
      if (response.status === 200) {
        showAlert(1, true, response.message);
        //update status
        var num_day_1 = parseInt($("#sprint_" + end_spid + " #s_team_" + end_tid).attr("data-num-day"));
        updateEachTeamDay(end_spid, end_tid, num_day_1);
      } else if (response.status === 800) { //error
        showAlert(0, true, response.message);
      }
    },
    error: function() {
      hideGlLoad();
    },
    complete: function() {
      hideGlLoad();
    }
  });
}

function moveToSprint(select_sid, start_spid, start_tid, end_spid, end_tid, order) {
  showGlLoad();
  $.ajax({
    url: 'sprint/move_story_to_sprint',
    type: 'POST',
    global: false,
    data: {select_sid: select_sid, start_spid: start_spid,
      start_tid: start_tid, end_spid: end_spid, end_tid: end_tid, order: order},
    success: function(response) {
      if (response.status === 200) {
        showAlert(1, true, response.message);
        //Update status
        var num_day_1 = parseInt($("#sprint_" + start_spid + " #s_team_" + start_tid).attr("data-num-day"));
        updateEachTeamDay(start_spid, start_tid, num_day_1);
        var num_day_2 = parseInt($("#sprint_" + end_spid + " #s_team_" + end_tid).attr("data-num-day"));
        updateEachTeamDay(end_spid, end_tid, num_day_2);

      } else if (response.status === 800) { //error
        showAlert(0, true, response.message);
      }
    },
    error: function() {
      hideGlLoad();
    },
    complete: function() {
      hideGlLoad();
    }
  });
}

function removeFromSprint(select_sid, start_spid, start_tid) {
  showGlLoad();
  $.ajax({
    url: 'sprint/remove_story_from_sprint',
    type: 'POST',
    global: false,
    data: {select_sid: select_sid, start_spid: start_spid, start_tid: start_tid},
    success: function(response) {
      if (response.status === 200) {
        showAlert(1, true, response.message);
        //update team day
        var num_day = parseInt($("#sprint_" + start_spid + " #s_team_" + start_tid).attr("data-num-day"));

        updateEachTeamDay(start_spid, start_tid, num_day);
        //
      } else if (response.status === 800) { //error
        showAlert(0, true, response.message);
      }
    },
    error: function() {
      hideGlLoad();
    },
    complete: function() {
      hideGlLoad();
    }
  });
}

function updateStoryOrder(selector) {
  var tid = $("#" + selector).attr("data-tid");
  var spid = $("#" + selector).parent().attr("data-spid");
  count = 0;  //reset counter
  var data = {};
  $("#" + selector + " .story").each(function() {
//        console.log("index: " + index + " -- " + $(this).text() + " --- " + $(this).attr("id"));
    if (typeof $(this).attr("id") != "undefined") {
      count++;
      $(this).attr("data-order", count);
//      data[$(this).attr("data-order")] = $(this).attr("data-sid");
      data[$(this).attr("data-sid")] = $(this).attr("data-order");
    }
  });
//  console.log("selector: " + selector);
//  console.log(data);
  if (count > 0) {
    //Send ajax update order
    $.ajax({
      url: "sprint/update_order",
      type: "POST",
      data: {tid: tid, spid: spid, data: data},
      success: function() {
      }
    });
  }

//  $("#" + selector + " .story").each(function() {
////      data[$(this).attr("data-sid")] = $(this).attr("data-order");
//      data[$(this).attr("data-order")] = $(this).attr("data-sid");
//  })

}


$(document).on("click", ".btn-start-sprint", function(e) {
  e.preventDefault();
  var spid = $(this).attr("data-spid");
  bootbox.confirm("Are you sure you want to start this sprint?", function(result) {
    if (result === true) {
      $.ajax({
        url: "/sprint/start_sprint",
        type: "POST",
        data: {spid: spid},
        success: function(response) {
          if (response.status === 200) {

          } else {
            showAlertModal(response.message);
          }
        }
      });
    }
  });
});

function completeSprint(spid) {
  $.ajax({
    url: "/sprint/complete_sprint",
    type: "POST",
    data: {spid: spid, check: 0},
    success: function(response) {
      if (response.status === 200) {
      } else {
        showAlertModal(response.message);
      }
    }
  });
}

$(document).on("click", ".btn-complete-sprint", function(e) {
  e.preventDefault();
  var spid = $(this).attr("data-spid");
  bootbox.confirm("Are you sure you want to mark this sprint as complete?", function(result) {
    if (result === true) {
      /*Check if sprint contain any uncompleted story*/
      $.ajax({
        url: "/sprint/complete_sprint",
        type: "POST",
        data: {spid: spid, check: 1},
        success: function(response) {
          if (response.status === 201) {
            if (response.data.length > 0) {
              var mes = "Sprint contains uncompleted story: <b>";
              $.each(response.data, function(key, val) {
                mes += val.name + ", ";
              });
              mes += "</b>Are you sure you still want to complete this sprint";
              bootbox.confirm(mes, function(result) {
                if (result === true) {
                  completeSprint(spid);
                }
              });
            } else {
              completeSprint(spid);
            }
          } else {
            showAlertModal(response.message);
          }
        }
      });

    }
  });
});

$(document).on("click", ".btn-resume-sprint", function(e) {
  e.preventDefault();
  var spid = $(this).attr("data-spid");
  bootbox.confirm("Are you sure you want to resume this sprint?", function(result) {
    if (result === true) {
      $.ajax({
        url: "/sprint/resume_sprint",
        type: "POST",
        data: {spid: spid},
        success: function(response) {
          if (response.status === 200) {
          } else {
            showAlertModal(response.message);
          }
        }
      });
    }
  });
});

//Delete sprint
$(document).on("click", ".delete-sprint", function(e) {
  e.preventDefault();
  var spid = $(this).attr("data-spid");
  bootbox.confirm("Are you sure you want to delete that sprint?", function(result) {
    if (result === true) {
      $.ajax({
        url: "sprint/delete",
        type: "POST",
        data: {spid: spid},
        success: function(response) {
          showAlert(1, true, response.message);
          setTimeout(function() {
            $("#modal-edit-sprint").modal('hide');
          }, 1000);
        }
      });
    }
  });
});

$(document).on("click", ".s-team-name", function(e) {
  e.preventDefault();
  var tid = $(this).parent().attr("data-tid");
  var spid = $(this).parent().parent().attr("data-spid");
  $.ajax({
    url: "sprint/get_team_day",
    type: "POST",
    data: {tid: tid, spid: spid},
    success: function(response) {
      if (response.status === 200) {
        $("#modal-edit-team-day #num_day").val(response.data);
        $("#modal-edit-team-day #spid").val(spid);
        $("#modal-edit-team-day #tid").val(tid);
        $("#modal-edit-team-day").modal("show");
      }
    }
  })
});

$("#form-edit-team-day").submit(function(e) {
  e.preventDefault();
  var spid = $("#form-edit-team-day #spid").val();
  var tid = $("#form-edit-team-day #tid").val();
  var num_day = $("#form-edit-team-day #num_day").val();
  if ($(this).valid() === true) {
    $.ajax({
      url: "sprint/update_team_day",
      type: "POST",
      data: $(this).serialize(),
      success: function(response) {
        if (response.status === 200) {
          showAlert(1, true, response.message);
          updateEachTeamDay(spid, tid, num_day);
          setTimeout(function() {
            $("#modal-edit-team-day").modal('hide');
          }, 1000);
        }
      }
    });
  }
});

function getTeamDayAll() {
  $.ajax({
    url: "sprint/get_team_day_all",
    type: "POST",
    success: function(response) {
//      console.log(response);
      $.each(response.data, function(key, value) {
//        console.log(value.tid);
        updateEachTeamDay(value.spid, value.tid, value.num_day);
      });
    }
  });
}

function updateEachTeamDay(spid, tid, num_day) {
//  console.log("-------num_day: " + num_day);
  //numday: number of working day for team
  var selector = "#sprint_" + spid + " #s_team_" + tid;
  $(selector).attr("data-num-day", num_day);
  //total number of story date
  var total_day = 0;
  $(selector + " .story").each(function() {
    total_day += parseInt($(this).attr("data-time-estimate"));
  });
  //assign to html
  $(selector + " .s-team-status").html(num_day + " / " + total_day);
  //highlight
  if (num_day < total_day) {
    $(selector + " .s-team-status").css("color", "#FF0000");
  } else {
    $(selector + " .s-team-status").css("color", "#0066FF");
  }
//  console.log(total_day);
}

function destroyStoryDragDrop() {
  $(".sprint-story-list .story-addable").each(function() {
    if ($(this).data("uiDraggable")) {
      $(this).draggable("destroy");
    }
  });

  $(".sprint-teams .story").each(function() {
    if ($(this).data("uiDraggable")) {
      $(this).draggable("destroy");
    }
  });

  $(".sprint-teams .s-team").each(function() {
    if ($(this).data("uiDroppable")) {
      $(this).droppable("destroy");
    }
  });

  $(".sprint-story-list").each(function() {
    if ($(this).data("uiDroppable")) {
      $(this).droppable("destroy");
    }
  });
}

function appendNewStoryHTML(story_data) {
  var story_temp = $(".story-temp").html();
  $(".story-temp .story").attr("id", "story_" + story_data.sid);
  $(".story-temp .story").attr("data-sid", story_data.sid);
  $(".story-temp .story").attr("data-name", story_data.name);
  $(".story-temp .story").attr("data-time-estimate", story_data.time_estimate);
  $(".story-temp .story-name a").attr("href", story_data.sid);
  $(".story-temp .story-name a").html(story_data.name);
  if (story_data.point !== null) {
    $(".story-temp .story-points").html(story_data.point + " point(s");
  } else {
    $(".story-temp .story-points").html("point(s");
  }
  $(".story-temp .story-status").html(story_status[story_data.status]);
  if (story_data.time_estimate !== null) {
    $(".story-temp .story-time_estimate").html(story_data.time_estimate + " day(s)");
  } else {
    $(".story-temp .story-time_estimate").html("day(s)");
  }
  if (story_data.time_estimate > 0 && story_data.time_estimate !== null
          && story_data.point > 0 && story_data.point !== null) {
    $(".story-temp .story").removeClass("story-unaddable");
    $(".story-temp .story").addClass("story-addable");
  }

  $("#story-not-se-list .scrollable").append($(".story-temp").html());
  $("story-temp").html(story_temp);
}

function updateStoryHTML(story_data) {
  var id = "#story_" + story_data.sid;
  $(id).attr("data-time-estimate", story_data.time_estimate);
  $(id + " .story-name a").html(story_data.name);
  $(id + " .story-points").html(story_data.point + " point(s");
  $(id + " .story-status").html(story_status[story_data.status]);
  $(id + " .story-time_estimate").html(story_data.time_estimate + " day(s)");
  if (story_data.time_estimate > 0 && story_data.point > 0
          && story_data.time_estimate !== null && story_data.point !== null) {
    $(id).removeClass("story-unaddable");
    $(id).addClass("story-addable");
  }
}

function updateSprintHTML(sprint_data) {
  var id = "#sprint_" + sprint_data.spid;
  $(id + " .sprint-name").html('<i class="glyphicon-folder_flag"></i> '
          + sprint_data.name + ' (' + sprint_data.start_date_es
          + ' - ' + sprint_data.end_date_es + ')');
  $(id + " .sprint-status").html(sprint_status[sprint_data.status]);
}

function updateTeamDay(team_data) {
  var ele = $("#sprint_" + team_data.spid + " #s_team_" + team_data.tid + " .s-team-status");
  var old_value = ele.html();
  var d = old_value.split(" / ")[1];
  ele.html(team_data.num_day + " / " + d);
  if (parseInt(d) <= parseInt(team_data.num_day)) {
    ele.css("color", "#0066ff");
  } else {
    ele.css("color", "#ff0000");
  }
}

function addStoryToSprint(data) {
  //IF already append -> do nothing
  if ($("#sprint_" + data.end_spid + " #s_team_" + data.end_tid + " #story_" + data.select_sid).length <= 0) {
    var story_temp = $(".story-temp").html();
    var story_data = data.story_data;
    $(".story-temp .story").attr("id", "story_" + story_data.sid);
    $(".story-temp .story").attr("data-sid", story_data.sid);
    $(".story-temp .story").attr("data-name", story_data.name);
    $(".story-temp .story").attr("data-order", data.order);
    $(".story-temp .story").attr("data-time-estimate", story_data.time_estimate);
    $(".story-temp .story-name a").attr("href", story_data.sid);
    $(".story-temp .story-name a").html(story_data.name);
    if (story_data.point !== null) {
      $(".story-temp .story-points").html(story_data.point + " point(s");
    } else {
      $(".story-temp .story-points").html("point(s");
    }
    $(".story-temp .story-status").html(story_status[story_data.status]);
    if (story_data.time_estimate !== null) {
      $(".story-temp .story-time_estimate").html(story_data.time_estimate + " day(s)");
    } else {
      $(".story-temp .story-time_estimate").html("day(s)");
    }
    if (story_data.time_estimate > 0 && story_data.time_estimate !== null
            && story_data.point > 0 && story_data.point !== null) {
      $(".story-temp .story").removeClass("story-unaddable");
      $(".story-temp .story").addClass("story-addable");
    }

    //remove form not assign list
    $("#story-not-se-list #story_" + story_data.sid).remove();
    //add to sprint list
    $("#sprint_" + data.end_spid + " #s_team_" + data.end_tid).append($(".story-temp").html())
    $("story-temp").html(story_temp);
  }
}

function removeStoryFromSprint(data) {
  var id = "#sprint_" + data.start_spid + " #s_team_" + data.start_tid + " #story_" + data.select_sid;
  console.log($(id));
  if ($(id).length >= 0) {
    $(id).remove();
  }
}

function sortByOrder(a, b) {
  var v1 = a.getAttribute("data-order");
  var v2 = b.getAttribute("data-order");
  return v1 > v2;
}

function updateStoryOrder2(data) {
  var spid = data.spid;
  var tid = data.tid;
  var list_sid = data.list_sid;
  $.each(list_sid, function(key, val) {
    $("#sprint_" + spid + " #s_team_" + tid + " #story_" + key).attr("data-order", val);
  });
  var list = $("#sprint_" + spid + " #s_team_" + tid + " .story").get();
  list.sort(sortByOrder);
  for (var i = 0; i < list.length; i++) {
    list[i].parentNode.appendChild(list[i]);
  }
}

function deleteSprintHTML(spid) {
  var html;
  var id;
  $("#sprint_" + spid + " .story").each(function() {
    id = $(this).attr("id");
    var ele = document.getElementById(id);
    html = ele.outerHTML;
    $("#story-not-se-list .scrollable").append(html);
    $(this).remove();
  });
  $("#sprint_" + spid).remove();
}

function hideAllSprintButton() {
  $("#sprint-team-list .sprint .btn-start-sprint").css("display", "none");
  $("#sprint-team-list .sprint .btn-complete-sprint").css("display", "none");
  $("#sprint-team-list .sprint .btn-resume-sprint").css("display", "none");
}

function updateAllSprintStatus(data) {
  if (data.sprint_status == 2) {
    //If start 1 sprint, hide all other sprint button
    hideAllSprintButton();
    $("#sprint_" + data.spid + " .btn-complete-sprint").css("display", "inline");
    $("#sprint_" + data.spid + " .sprint-status").html(sprint_status[2]);
  } else {
    $("#sprint-team-list .sprint").each(function() {
      var id = $(this).attr("id");
      var status = $(this).attr("data-sprint-status");
      $("#" + id + " .actions .btn").css("display", "none");
      if (status == 1) {
        $("#" + id + " .actions .btn-start-sprint").css("display", "inline");
      } else if (status == 2) {
        $("#" + id + " .actions .btn-complete-sprint").css("display", "inline");
      } else if (status == 3) {
        $("#" + id + " .actions .btn-resume-sprint").css("display", "inline");
      }
      $("#" + id + " .sprint-status").html(sprint_status[status]);
    });

    if (data.old_status == 3) {
      //If resume a completed sprint
      $("#sprint_" + data.spid + " .box-content div:first-child").removeClass(".sprint-teams-disabled");
      destroyStoryDragDrop();
      initStoryDragDrop();
    } else if (data.status == 3) {
      //If complete a sprint
      $("#sprint_" + data.spid + " .box-content div:first-child").addClass(".sprint-teams-disabled");
      $("#sprint_" + data.spid + " .box-content div:first-child").removeClass(".sprint-teams-disabled");
      destroyStoryDragDrop();
      initStoryDragDrop();
    }
  }
}

function appendSprintHTML(sprint_data) {
  var sprint_temp = $(".sprint-temp").html();
  $(".sprint-temp .sprint").attr("id", "sprint_" + sprint_data.spid);
  $(".sprint-temp .sprint").attr("data-sprint-status", sprint_data.status);
  $(".sprint-temp .sprint a").attr("href", sprint_data.spid);
  $(".sprint-temp .sprint-teams").attr("data-spid", sprint_data.spid);
  var title = '<i class="glyphicon-folder_flag"></i> '
          + sprint_data.name + ' (' + sprint_data.start_date_es
          + ' - ' + sprint_data.end_date_es + ')';
  $(".sprint-temp .sprint a").html(title);
  $(".sprint-temp .btn-start-sprint").attr("data-spid", sprint_data.spid);
  $(".sprint-temp .btn-complete-sprint").attr("data-spid", sprint_data.spid);
  $(".sprint-temp .btn-resume-sprint").attr("data-spid", sprint_data.spid);

  //append to list sprint
  $("#sprint-team-list").append($(".sprint-temp").html());
  $(".sprint-temp").html(sprint_temp);
}

function removeUncompletedStoryHTML(data) {
  var uncompleted_story = data.uncompleted_story;
  var spid = data.spid;
  if (uncompleted_story.length > 0) {
    $.each(uncompleted_story, function(key, val) {
      var html = $("#sprint_" + spid + " #story_" + val.sid).remove();
      $("#story-not-se-list .scrollable").append(html);
    });
  }
  $("#sprint_" + spid + " .sprint-teams").addClass("sprint-teams-disabled");
  $("#sprint_" + spid + " .sprint-teams-disabled").removeClass("sprint-teams");
}

function resumeSprintHTML(data) {
  var spid = data.spid;
  $("#sprint_" + spid + " .sprint-teams-disabled").addClass("sprint-teams");
  $("#sprint_" + spid + " .sprint-teams").removeClass("sprint-teams-disabled");
}