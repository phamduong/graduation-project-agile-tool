var oTable;
$(document).ready(function() {
  var callback = function(topic, data) {
//    if(data.type == 'add'){
//      var oTable = $("#user_story_datatable").dataTable();
//      oTable.fnReloadAjax();
//    }else if(data.type == 'update'){
//      
//    }
    if (topic === "scrum.realtime_" + current_project + ".story") {
      var oTable = $("#user_story_datatable").dataTable();
      oTable.fnReloadAjax();
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
    } else if (topic === "scrum.realtime_" + current_project + ".sprint") {
      switch (data.type) {
        case "add_story_to":
        case "remove_story_from":
        case "move_story":
        case "update_sprint":
        case "complete_sprint":
        case "resume_sprint":
        case "start_sprint":
        case "delete_sprint":
          {
            var oTable = $("#user_story_datatable").dataTable();
            oTable.fnReloadAjax();
            break;
          }
      }
    }
  };
  var link = ["scrum.realtime_" + current_project + ".story",
    "scrum.realtime_" + current_project + ".task",
    "scrum.realtime_" + current_project + ".sprint"];
  subscribeToTopic(link, 'localhost', '8080', callback);

  initUserStoryDatatable();
  //Choose edit and user story
  $("#user_story_datatable").on("click", ".view_story", function(event) {
    event.preventDefault();
    var sid = $(this).attr('href');
    window.current_story = sid;
    editStorySubmit(sid);
  });

  $("#tab-story-info-edit").on("click", ".approve-story", function(e) {
    //If status === New -> allow to appoved it
    e.preventDefault();
    var sid = $(this).attr("data-sid");
    $.ajax({
      url: "/story/approve",
      type: "POST",
      data: {sid: sid},
      success: function(response) {
        if (response.status === 200) {
          showAlert(1, true, response.message);
          setTimeout(function() {
            $("#modal-edit-story").modal("hide");
          }, 1000);
//          appendStoryToHTML();
        } else if (response.status === 200) {
          showAlert(0, true, response.message);
        }
      }
    });
  });

  $("#tab-story-info-edit").on("click", ".delete-story", function(e) {
    e.preventDefault();
    var sid = $(this).attr("data-sid");
    bootbox.confirm("Are you sure you want to delete this story?", function(result) {
      if (result === true) {
        $.ajax({
          url: "/story/delete",
          type: "POST",
          data: {sid: sid},
          success: function(response) {
            if (response.status === 200) {
              showAlert(1, true, response.message);
              setTimeout(function() {
                $("#modal-edit-story").modal("hide");
              }, 1000);
//              appendStoryToHTML();
            } else if (response.status === 200) {
              showAlert(0, true, response.message);
            }
          }
        });
      }
    });
  });

  $("#btn-add-story").click(function(e) {
    e.preventDefault();
    $("#modal-add-story .attach").html('<input type="file" name="attach[]" id="story-attach-add" multiple/>');
    $("#modal-add-story").modal("show");
  });

});

function initUserStoryDatatable() {
  if ($("#user_story_datatable").length > 0) {
    var sAjaxSource = "/story/datatables";
    var opt = {
      "sAjaxSource": sAjaxSource,
      "sDom": "<'row-fluid well-search'<'span5'Ti><'span2'f><'span5'pl><'clear'><'container-processing'r>>t<'row-fluid'<'span6'i><'span6'p>>",
      "sPaginationType": "full_numbers",
      "aoColumns": [
//        {"mData": "sid"},
        {"mData": "story_name"},
        {"mData": "priority"},
        {"mData": "time_estimate"},
        {"mData": "point"},
        {"mData": "status"},
        {"mData": "sprint_name"},
        {"mData": "team_name"},
        {"mData": "sid"}
      ],
      'aoColumnDefs': [
        {
          'bSortable': false,
          'aTargets': [7]
        },
//        {
//          "bVisible": false,
//          'aTargets': [0]
//        },
        {
          "mRender": function(data, type, row) {
            switch (row["priority"]) {
              case 1:
                return "<span class='label label-important'>Urgent</span>";
                break;
              case 2:
                return "<span class='label label-warning'>High</span>";
                break;
              case 3:
                return "<span class='label label-info'>Medium</span>";
                break;
              case 4:
                return "<span class='label'>Low</span>";
                break;
            }
          },
          'aTargets': [1]
        },
        {
          "mRender": function(data, type, row) {
            switch (row["status"]) {
              case 1:
                return "New";
                break;
              case 2:
                return "Approved";
                break;
              case 3:
                return "Estimated";
                break;
              case 4:
                return "Asigned to sprint";
                break;
              case 5:
                return "To do";
                break;
              case 6:
                return "In progress";
                break;
              case 7:
                return "To test";
                break;
              case 8:
                return "Done";
                break;
              case 9:
                return "Sprint completed";
                break;
            }
          },
          'aTargets': [4]
        },
        {
          "mRender": function(data, type, row) {
            var html = '<div id="story_' + row['sid'] + '_ac"><a href="' + row['sid'] + '" class="btn view_story" rel="tooltip" title="View"><i class="icon-edit"></i></a>'
                    + '</div>';
            return html;
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
    oTable = $('#user_story_datatable').dataTable(opt);

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
//        {
//          type: "text"
//        },
        {
          type: "text"
        },
        {
          type: "select",
          bCaseSensitive: false,
          values: [
            "Urgent",
            "High",
            "Medium",
            "Low"
          ]
//          values: [
//            {label: 'Urgent', value: 1},
//            {label: 'High', value: 2},
//            {label: 'Medium', value: 3},
//            {label: 'Low', value: 4}
//          ]
        },
        {
          type: "text"
        },
        {
          type: "text"
        },
        {
          type: "select",
          values: [
            "New",
            "Approved",
            "Estimated",
            "Asigned to sprint",
            "To do",
            "In progress",
            "To test",
            "Done",
            "Sprint completed"
          ]
//          values: [
//            {label: 'New', value: 1},
//            {label: 'Approved', value: 2},
//            {label: 'Estimated', value: 3},
//            {label: 'Asigned', value: 4},
//            {label: 'To do', value: 5},
//            {label: 'In progress', value: 6},
//            {label: 'To test', value: 7},
//            {label: 'Done', value: 8},
//            {label: 'Sprint completed', value: 9}
//          ]
        },
        {
          type: "text"
        },
        {
          type: "text"
        },
        //null
      ]
    });
    $("#user_story_datatable").css("width", '100%');
    $('table#user_story_datatable > thead > tr:last-child').hide();

    var html = '<button id="advanceFilter" class="advance-filter mr10 pull-right"><i class="icon-filter"></i></button>';
    $('#user_story_datatable_wrapper > div.well-search > div:nth-child(3)').prepend(html);

    $('#user_story_datatable_wrapper #advanceFilter').click(function() {

      $('#user_story_datatable > thead > tr:last-child').toggle();
      if ($('#advanceFilter').hasClass('advance-filter-active')) {
        $('#advanceFilter').removeClass('advance-filter-active');
        // reset_dt_view(oTable);
        oTable.fnDraw();
      } else {
        $('#advanceFilter').addClass('advance-filter-active');
      }
    });
  }
}
