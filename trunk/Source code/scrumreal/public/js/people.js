var start_tid;
var end_tid;
var select_uid;
var ele;
$(document).ready(function() {
  //Init dragable and dropable in people management page
  initPeopleDragDrop();

  $("#form-add-team").submit(function(event) {
    event.preventDefault();
    if ($(this).valid() === true) {
      $.ajax({
        url: '/team/add',
        type: 'POST',
        data: $(this).serialize(),
        success: function(response) {
          if (response.status === 800) { //error
            showAlert(0, true, response.message);
          } else if (response.status === 200) {
            showAlert(1, true, response.message);
            //Append new team to HTML

            setTimeout(function() {
              $("#modal-add-team").modal('hide');
            }, 1000);
            clearFormInput("#form-add-team");
          }
        }
      });
    }
  });

  //Submit form edit team
  $("#form-edit-team").submit(function(e) {
    e.preventDefault();
    if ($(this).valid() === true) {
      var tid = $("#form-edit-team #tid").val();
      $.ajax({
        url: "/team/save",
        type: "POST",
        data: $(this).serialize(),
        success: function(response) {
          if (response.status === 200) {
            showAlert(1, true, response.message);
            $("#team_" + tid).html("");
            $("#team_" + tid).load("/team/reload_team_data/" + tid);
            var page = $(location).attr('pathname');
            if (page === "/people") {
              //in people page -> reload staff list
              $("#staff-list .box-content").html();
              $("#staff-list .box-content").load("/people/reload_list_staff");
              setTimeout(function() {
                $("#modal-edit-team").modal("hide");
              }, 1000);
            }
          } else if (response.status === 200) {
            showAlert(0, true, response.message);
          }
        }
      });
    }
  });

  //Delete team
  $(".delete-team").click(function(e) {
    e.preventDefault();
    var tid = $(this).attr("data-tid");
    $.ajax({
      url: "/team/delete",
      type: "POST",
      data: {tid: tid},
      success: function(response) {
        if (response.status === 200) {
          showAlert(1, true, response.message);
          setTimeout(function() {
            $("#modal-edit-team").modal("hide");
          }, 1000);
          //appendStoryToHTML();
        } else if (response.status === 200) {
          showAlert(0, true, response.message);
        }
      }
    });
  });

  //View user detail
  $("#staff-list").on("click", ".person-name", function(event) {
    var uid = $(this).parent().attr("data-uid");
    $.ajax({
      url: "/user/edit",
      type: "POST",
      data: {uid: uid},
      global: false,
      success: function(response) {
        if (response.status === 200) {
          var parent = "#modal-edit-user #form-edit-user ";
          var user_info = response.user_info;
          $(parent + "#fullname").val(user_info.fullname);
          $(parent + "#birthday").val(user_info.birthday);
          $(parent + ".delete-user").attr("data-uid", user_info.uid);
          $("#modal-edit-user").modal('show');
        }
      }, error: function(response) {
        var err = jQuery.parseJSON(response.responseText);
        $("#modal-error-notice .error-content").html(err.error.message);
        $("#modal-error-notice").modal('show');
      }
    });
  });

  //Delete user
  $(document).on("click", '.delete-user', function(e) {
    e.preventDefault();
    var uid = $(this).attr("data-uid");
    $.ajax({
      url: "/user/delete",
      type: "POST",
      data: {uid: uid},
      success: function(response) {
        if (response.status === 200) {
          var page = $(location).attr('pathname');
          if (page === "/people") {
            //in people page -> reload staff list
            $("#staff-list .box-content").html();
            $("#staff-list .box-content").load("/people/reload_list_staff");
            setTimeout(function() {
              $("#modal-edit-user").modal("hide");
            }, 1000);
          }
        }
      }
    });
  })

  //View team info
  $(".team-list").on("click", ".team-name", function(event) {
    $('body').modalmanager('loading');
    var tid = $(this).attr("href");
    $.ajax({
      url: "/team/edit",
      type: "POST",
      data: {tid: tid},
      global: false,
      success: function(response) {
        if (response.status === 200) {
          var parent = "#modal-edit-team #form-edit-team ";
          var team_info = response.team_info;
          $(parent + "#tid").val(team_info.tid);
          $(parent + "#name").val(team_info.name);
//          var temp = '<option value="' + team_info.master_id + '">' + team_info.master_name + '</option>';
//          $(parent + "#master").append(temp);
          $(parent + "#master").select2("data", {id: team_info.master_id, text: team_info.master_name});
          $(parent + "#description").val(team_info.description);
          $(parent + ".delete-team").attr("data-tid", team_info.tid);
          //comment
          var comment = response.comment;
          getComment("#modal-edit-team", tid, comment);

          getActivity("#modal-edit-team", 3, tid, 0, 10);

          $("#modal-edit-team").modal('show');
        }
      }, error: function(response) {
        var err = jQuery.parseJSON(response.responseText);
        $("#modal-error-notice .error-content").html(err.error.message);
        $("#modal-error-notice").modal('show');
      }
    });
    event.preventDefault();
  });
});

/**
 * Sort list person by name in List Staff
 * @returns {undefined}
 */
function sortPeopleList() {
  var list_people_sortable = $(".people-list .scrollable");
  var list_people = $(".person", list_people_sortable);
  list_people.sort(function(a, b) {
    // console.log(a.getAttribute("data-value"));
    return a.getAttribute("data-name").toUpperCase() > b.getAttribute("data-name").toUpperCase();
  });
  // console.log(list_people);
  list_people_sortable.append(list_people);
}

/**
 * 
 * @param {type} parent
 * @returns {undefined}
 */
function sortTeamMemberList(parent) {
  var list_team_mem_sortable = $("#" + parent + " .team-members");
  var list_team_mem = $(".person", list_team_mem_sortable);
  list_team_mem.sort(function(a, b) {
    return a.getAttribute("data-name").toUpperCase() > b.getAttribute("data-name").toUpperCase();
  });
  list_team_mem_sortable.append(list_team_mem);
}

function initPeopleDragDrop() {
  var ele;
  var parent;
  var start_tid = 0;
  var start_id;
  var select_id;
  var select_uid;
  var end_tid;
  //sort list people
  $(".people-list .scrollable").sortable({
    items: ".person",
    opacity: 0.7,
    placeholder: 'widget-placeholder-2',
    forcePlaceholderSize: true,
    tolerance: "pointer"
  });
  // there's the people and the team-members
  var $people = $(".people-list"),
          $team = $(".team-members");
  // let the people items be draggable
  $(".people-list .person").draggable({
    cancel: "a.ui-icon", // clicking an icon won't initiate dragging
    revert: "invalid", // when not dropped, the item will revert back to its initial position
    containment: "document",
    helper: "clone",
    cursor: "move",
    start: function(event, ui) {
//      console.log("from people");
      ele = ui["helper"];
      parent = ele.parent().parent().parent();
      start_tid = 0;  //Mean: drag from people list not team list
      if (parent.attr("id") == "staff-list") { //Drag from people-list
        select_id = "member_" + ele.attr("data-uid");
        start_id = "staff-list";
      } else { //Drag from team list
        parent = ele.parent().parent().parent().parent();
        start_tid = parent.attr("data-tid");
        start_id = parent.attr("id");
        select_id = "member_" + ele.attr("data-uid");
      }
    }
  });
  //drop members to free area
  $(".team-members .person").draggable({
    cancel: "a.ui-icon", // clicking an icon won't initiate dragging
    revert: "invalid", // when not dropped, the item will revert back to its initial position
    containment: "document",
    helper: "clone",
    cursor: "move",
    start: function(event, ui) {
//      console.log("from team");
      ele = ui.helper;
      parent = ele.parent().parent().parent().parent();
      if (parent.hasClass("team")) {
        start_tid = parent.attr("data-tid");
        start_id = parent.attr("id");
        select_id = "member_" + ele.attr("data-uid");
      } else {
        parent = ele.parent().parent().parent();
        select_id = "member_" + ele.attr("data-uid");
        start_id = "staff-list";
      }
    }
  });
  // let the team-members be droppable, accepting the people items
  $team.droppable({
    accept: ".person",
    //activeClass: "ui-state-highlight",
    drop: function(event, ui) {
      $(this).append(ui.draggable);
      if ($("#" + start_id).find("#" + select_id).length == 0) {
        select_uid = $("#" + select_id).attr("data-uid");
//        console.log(ui);
        ele = ui.draggable;
        parent = ele.parent().parent().parent().parent();
        end_tid = parent.attr("data-tid");
        console.log("drop to team");
        console.log("uid " + select_uid);
        if (start_tid == 0) { //If add people to project
          //Send ajax
          addToProject(select_uid, end_tid);
        } else {  //If move people from team to team
          console.log("start_tid: " + start_tid);
          moveToTeam(start_tid, end_tid, select_uid)
        }
        console.log("end_tid: " + end_tid);
        //Sort list member in team
        sortTeamMemberList("team_" + end_tid);
      }
    }
  });
  // let the people be droppable as well, accepting items from the team-members
  $people.droppable({
    accept: ".person",
    // activeClass: "custom-state-active",
    drop: function(event, ui) {
      $(this).find(".scrollable").append(ui.draggable);
      if ($("#" + start_id).find("#" + select_id).length == 0) {
        select_uid = $("#" + select_id).attr("data-uid");
        console.log("drop to people");
        console.log(select_uid);
        //Remove people from project
        removeFromProject(select_uid, start_tid);
        start_tid = 0;
      }
      //Sort by name
      sortPeopleList();
      $(".people-list .scrollable").sortable("refresh");
    }
  });
  //Sort
  sortPeopleList();
  $(".team").each(function() {
    if ($(this).attr("id") != "") {
      sortTeamMemberList($(this).attr("id"));
    }
  });
}

function removeFromProject(select_uid, start_tid) {
  showGlLoad();
  $.ajax({
    url: "/people/remove_from_project",
    type: "POST",
    global: false,
    data: {select_uid: select_uid, tid: start_tid},
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

function addToProject(select_uid, end_tid) {
  showGlLoad();
  $.ajax({
    url: "/people/add_to_project",
    type: "POST",
    global: false,
    data: {select_uid: select_uid, end_tid: end_tid},
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

function moveToTeam(start_tid, end_tid, select_uid) {
  showGlLoad();
  $.ajax({
    url: "/people/move_to_team",
    type: "POST",
    data: {start_tid: start_tid, end_tid: end_tid, select_uid: select_uid},
    success: function(response) {
      if (response.status === 200) {
        showAlert(1, true, response.message);
      } else if (response.status === 800) { //error
        showAlert(0, true, response.message);
      }
    },
    complete: function() {
      hideGlLoad();
    }
  });
}