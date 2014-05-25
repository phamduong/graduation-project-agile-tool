$(document).ready(function() {
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
          if (response.status === 800) { //error
            showAlert(0, true, response.message);
          } else if (response.status === 200) {
            showAlert(1, true, response.message);
            setTimeout(function() {
              $("#modal-add-sprint").modal('hide');
            }, 1000);
            clearFormInput("#form-add-sprint");
          }
        }
      });
    }
  });

  //Edit sprint
  $("#sprint-team-list").on("click", ".sprint-name", function(event) {
    event.preventDefault();
    $('body').modalmanager('loading');
    $.ajax({
      url: 'sprint/edit',
      type: 'POST',
      data: {spid: $(this).attr("href")},
      global: false,
      success: function(response) {
        if (response.status === 200) {
          var parent = "#modal-edit-sprint #form-edit-sprint ";
          var sprint_info = response.sprint_info;
          $(parent + "#name").val(sprint_info.name);
          $(parent + "#sprint_time").val(sprint_info.start_date + " - " + sprint_info.end_date);
          $(parent + "#description").val(sprint_info.description);
          $(parent + ".complete-sprint").attr("data-spid", response.spid);
          $("#modal-edit-sprint").modal('show');
        }
      },
      error: function(response) {
        var err = jQuery.parseJSON(response.responseText);
        $("#modal-error-notice .error-content").html(err.error.message);
        $("#modal-error-notice").modal('show');
      }
    });
  });
});

function sortStoryList() {
  var list_story_sortable = $(".sprint-story-list .scrollable");
  var list_story = $(".story", list_story_sortable);
  list_story.sort(function(a, b) {
    return a.getAttribute("data-name").toUpperCase() > b.getAttribute("data-name").toUpperCase();
  });
  list_story_sortable.append(list_story);
}

function initStoryDragDrop() {
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
  var current_team;
  var order;

  var count = 0;

  var insideMain = false;

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
  $(".sprint-story-list .story").draggable({
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
        start_id = parent.attr("id"); //start from team ?
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
        start_id = parent.attr("id");
      } else {  //Drag from story list
        parent = ele.parent().parent().parent();
        select_id = "story_" + ele.attr("data-sid");
        start_id = "story-not-se-list";
      }
    }
  });

  $sprint_team.droppable({
//    activeClass: "ui-state-highlight",
    drop: function(event, ui) {
      $(this).append(ui.draggable);
      if ($("#" + start_id).find("#" + select_id).length == 0) {
        select_sid = $("#" + select_id).attr("data-sid");
        ele = ui.draggable;
        parent = ele.parent();
        end_tid = parent.attr("data-tid");
        end_spid = parent.parent().attr("data-spid");
        if (start_tid == 0 && start_spid == 0) { //If add story to sprint
          console.log("insideMain: " + insideMain);
          console.log("start_id: " + start_id + " select_id: " + select_id);
          console.log("add: " + select_sid + " to team :" + end_tid + " ,sprint: " + end_spid);
        } else {
          console.log("add: " + select_sid + " to team :" + end_tid + " ,sprint: " + end_spid + " from team: " + start_tid + " from sprint: " + start_spid);
        }
      }
      insideMain = false;
      //Data order
      current_team = ui.draggable.parent().attr("id");
      count = 1
      $("#" + current_team + " .story").each(function(index) {
//        console.log("index: " + index + " -- " + $(this).text() + " --- " + $(this).attr("id"));
        if (typeof $(this).attr("id") != "undefined") {
          $(this).attr("data-order", count);
          count++;
        }
      });
      //Oder
      order = $("#" + select_id).attr("data-order");
//      console.log("order: " + order);
    },
    accept: function() {
      return insideMain;
    }
  });

  $story_list.droppable({
    accept: ".story",
    // activeClass: "custom-state-active",
    drop: function(event, ui) {
      $(this).find(".scrollable").append(ui.draggable);
      if ($("#" + start_id).find("#" + select_id).length == 0) {
        select_sid = $("#" + select_id).attr("data-sid");
        console.log("Drop story: " + select_sid + " to story list from team: " + start_tid + " ,from sprint: " + start_spid);
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