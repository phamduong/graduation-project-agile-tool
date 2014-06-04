var oTable;
$(document).ready(function() {
  initUserStoryDatatable();
  //Choose edit and user story
  $("#user-story-datatable").on("click", ".view_story", function(event) {
    event.preventDefault();
    $('body').modalmanager('loading');
    var sid = $(this).attr('href');
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
  });

  $("#form-edit-story").on("click", ".approve-story", function(e) {
    //If status === New -> allow to appoved it
    e.preventDefault();
    if ($(this).attr("status") === 1) {
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
            appendStoryToHTML();
          } else if (response.status === 200) {
            showAlert(0, true, response.message);
          }
        }
      });
    }
  });

});


function initUserStoryDatatable() {
  if ($("#user-story-datatable").length > 0) {
    var sAjaxSource = "/story/datatables";
    var opt = {
      "sAjaxSource": sAjaxSource,
      "sDom": "<'row-fluid well-search'<'span5'Ti><'span2'f><'span5'pl><'clear'><'container-processing'r>>t<'row-fluid'<'span6'i><'span6'p>>",
      "sPaginationType": "full_numbers",
      "oLanguage": {
        "sSearch": "<span>Search:</span> ",
        "sInfo": "Showing <span>_START_</span> to <span>_END_</span> of <span>_TOTAL_</span> entries",
        "sLengthMenu": "_MENU_ <span>entries per page</span>"
      },
      "aoColumns": [
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
            $html = '<div id="story_' + row['sid'] + '_ac"><a href="' + row['sid'] + '" class="btn view_story" rel="tooltip" title="View"><i class="icon-edit"></i></a>'
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
    oTable = $('#user-story-datatable').dataTable(opt);

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
          type: "select",
          bCaseSensitive: false,
          values: ['Urgent', 'High', 'Medium', 'Low']
        },
        {
          type: "text",
        },
        {
          type: "text",
        },
        {
          type: "select",
          bCaseSensitive: false,
          values: ['New', 'Estimated', 'Asigned to sprint',
            'To do', 'In progress', 'To test', 'Done',
            'Sprint completed']
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
    $("#user-story-datatable").css("width", '100%');
    $('table#user-story-datatable > thead > tr:last-child').hide();

    var html = '<button id="advanceFilter" class="advance-filter mr10 pull-right"><i class="icon-filter"></i></button>';
    $('div.dataTables_wrapper > div.well-search > div:nth-child(3)').prepend(html);

    $('#advanceFilter').click(function() {
      $('table#user-story-datatable > thead > tr:last-child').toggle();
      if ($('#advanceFilter').hasClass('advance-filter-active')) {
        $('#advanceFilter').removeClass('advance-filter-active');
        // reset_dt_view(oTable);
      } else {
        $('#advanceFilter').addClass('advance-filter-active');
      }
    });
  }
}
