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
            setTimeout(function() {
              location.reload();
            }, 500);
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
            setTimeout(function() {
              location.reload();
            }, 500);
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
          $(parent + "#sprint_time").val(sprint_info.start_date + " - " + sprint_info.end_date);
          $(parent + "#description").val(sprint_info.description);
          $(parent + ".complete-sprint").attr("data-spid", response.spid);
          //comment
          var comment = response.comment;
          getComment("#modal-edit-sprint", spid, comment);
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
    return a.getAttribute("data-name").toUpperCase() > b.getAttribute("data-name").toUpperCase();
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

  $sprint_team.droppable({
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

  $story_list.droppable({
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
  console.log("selector: " + selector);
  console.log(data);
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