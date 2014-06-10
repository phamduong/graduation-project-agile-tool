var oTable;
$(document).ready(function() {
  initProjectDatatable();
  //Add user in project add modal
  $("#modal-add-project a.btn-add-user").click(function() {
    $("#selected-role").val($(this).attr('data-selected'));
    $("#modal-add-user").modal('show');
  });

  //Add new project
  $("#form-add-project").submit(function(event) {
    if ($(this).valid() === true) {
      $.ajax({
        url: "/project/add",
        type: "POST",
        data: $(this).serialize(),
        success: function(response) {
          if (response.status === 800) { //error
            showAlert(0, true, response.message);
          } else if (response.status === 200) {
            showAlert(1, true, response.message);
            oTable.fnReloadAjax();
            setTimeout(function() {
              $("#modal-add-project").modal('hide');
            }, 1000);
            clearFormInput("#form-add-story");
          }
        }
      });
    }
    event.preventDefault();
  });

  $("#form-edit-project").submit(function(e) {
    e.preventDefault();
    if ($(this).valid() === true) {
      $.ajax({
        url: "/project/save",
        type: "POST",
        data: $(this).serialize(),
        success: function(response) {
          if (response.status === 200) {
            showAlert(1, true, response.message);
            setTimeout(function() {
              $("#modal-edit-project").modal('hide');
            }, 1000);
            var oTable = $("#project-datatable").dataTable();
            oTable.fnReloadAjax();
            setTimeout(function() {
              clearFormInput("#form-edit-task");
            }, 1000);
          }
        }
      })
    }
  })

  //Edit project 
  $("#project-datatable").on("click", ".view_prj", function(event) {
    var pid = $(this).attr('href');
    $('body').modalmanager('loading');
    $.ajax({
      url: "/project/edit",
      type: "POST",
      data: {pid: pid},
      global: false,
      success: function(response) {
        if (response.status === 200) {
          //Set project info content
          var parent = "#modal-edit-project #form-edit-project ";
          var project_info = response.project_info;
          $(parent + "#pid").val(project_info.pid);
          $(parent + "#name").val(project_info.name);
          $(parent + "#project_date_range").val(project_info.start_date + ' - ' + project_info.end_date);
//          $(parent + "#leader").val(project_info.leader_id);
          //Because project owner is not on the list
//          var temp = '<option value="' + project_info.owner_name + '">' + project_info.owner_name + '</option>';
//          $(parent + "#owner").append(temp);
          if (project_info.leader_id !== null) {
            $(parent + "#leader").select2("data", {id: project_info.leader_id, text: project_info.leader_name});
          }
          if (project_info.owner_id !== null) {
            $(parent + "#owner").select2("data", {id: project_info.owner_id, text: project_info.owner_name});
          }
          $(parent + "#description").val(project_info.description);
          $(parent + "#note").val(project_info.note);
          
          //Set project comment
          var comment = response.comment;
          getComment("#modal-edit-project", pid, comment);
          
          getActivity("#modal-edit-project", 1, pid, 0, 10);
          
          $("#modal-edit-project").modal("show");
        }
      }, error: function(response) {
        var err = jQuery.parseJSON(response.responseText);
        $("#modal-error-notice .error-content").html(err.error.message);
        $("#modal-error-notice").modal('show');
      }
    });
    event.preventDefault();
  });

  //Set current project
  $("#project-datatable").on("click", ".set_prj", function(event) {
    var pid = $(this).attr('href');
    var wrapper = "#project_" + pid + "_ac";
    showLoading(wrapper);
    $.ajax({
      url: "/project/set_current",
      type: "POST",
      data: {pid: pid},
      global: false,
      success: function(response) {
        if (response.status === 200) {
          showAlert(1, true, response.message);
          $(".row_selected").removeClass("row_selected");
          $(wrapper).parent().parent().addClass("row_selected");
        }
      }, error: function(response) {
        var err = jQuery.parseJSON(response.responseText);
        $("#modal-error-notice .error-content").html(err.error.message);
        $("#modal-error-notice").modal('show');
      },
      complete: function() {
        hideLoading(wrapper);
      }
    });
    event.preventDefault();
  });
});

/**
 * Initialize datatables for project
 * @returns {undefined}
 */
function initProjectDatatable() {
  if ($("#project-datatable").length > 0) {
    var sAjaxSource = "/project/datatables";
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
        {"mData": "name"},
        {"mData": "owner"},
        {"mData": "leader"},
        {"mData": "start_date"},
        {"mData": "end_date"},
        {"mData": "status"},
        {"mData": "pid"}
      ],
      'aoColumnDefs': [
        {
          'bSortable': false,
          'aTargets': [5, 6],
        },
        {
          "mRender": function(data, type, row) {
            switch (row["status"]) {
              case 0:
                return "<span class='label label-inverse'>Cancled</span>";
                break;
              case 1:
                return "<span class='label label-satgreen'>Active</span>";
                break;
              case 2:
                return "<span class='label label-info'>Completed</span>";
                break;
            }
          },
          'aTargets': [5]
        },
        {
          "mRender": function(data, type, row) {
            $html = '<div id="project_' + row['pid'] + '_ac"><a href="' + row['pid'] + '" class="btn view_prj" rel="tooltip" title="View"><i class="icon-edit"></i></a>' +
                    '<a href="' + row['pid'] + '" class="btn set_prj" rel="tooltip" title="Set current"><i class="icon-ok"></i></a>' +
                    '<span class="loader"><img src="img/loading.gif" /></span></div>';
            return $html;
          },
          'aTargets': [6]
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
      "oColVis": {
        "buttonText": "Change columns <i class='icon-angle-down'></i>"
      },
      "oTableTools": {
        "aButtons": []
//        "sRowSelect": "single",
//        "sSelectedClass": "row_selected"
      },
      "fnDrawCallback": function(oSettings) {
        //alert(current_project);
        if (typeof current_project != "undefined") {
          var wrapper = "#project_" + current_project + "_ac";
          if (typeof $(wrapper)[0] != "undefined") {
            $(wrapper).parent().parent().addClass("row_selected");
          }
        }
      }
    };
    oTable = $('#project-datatable').dataTable(opt);
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
      'aoColumns': [{
          type: "text",
        }, {
          type: "text",
        }, {
          type: "text",
        }, {
          type: "date-range",
          sRangeFormat: "{from} {to}",
        }, {
          type: "date-range",
          sRangeFormat: "{from} {to}",
        }, {
          type: "select",
          bCaseSensitive: false,
          values: ['Cancled', 'Active', 'Completed']
        },
        null
      ]
    });
    $("#project-datatable").css("width", '100%');
    $('table#project-datatable > thead > tr:last-child').hide();
    var html = '<button id="advanceFilter" class="advance-filter mr10 pull-right"><i class="icon-filter"></i></button>';
    $('div.dataTables_wrapper > div.well-search > div:nth-child(3)').prepend(html);
    $('#advanceFilter').click(function() {
      $('table#project-datatable > thead > tr:last-child').toggle();
      if ($('#advanceFilter').hasClass('advance-filter-active')) {
        $('#advanceFilter').removeClass('advance-filter-active');
        // reset_dt_view(oTable);
      } else {
        $('#advanceFilter').addClass('advance-filter-active');
      }
    });
  }
  return oTable;
}