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
        url: "project/add",
        type: "POST",
        data: $(this).serialize(),
        success: function(response) {
          if (response.status === 800) { //error
            showAlert(0, true, response.message);
          } else if (response.status === 200) {
            showAlert(1, true, response.message);
            setTimeout(function() {
              $("#modal-add-project").modal('hide');
            }, 1000);
          }
        }
      });
    }
    event.preventDefault();
  });

  //Edit project 
  $("#project-datatable").on("click", ".view_prj", function(event) {
    var pid = $(this).attr('href');
    $('body').modalmanager('loading');
    $.ajax({
      url: "project/edit",
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
          $(parent + "#leader").val(project_info.leader_id);
          //Because project owner is not on the list
          var temp = '<option value="' + project_info.owner_name + '">' + project_info.owner_name + '</option>';
          $(parent + "#owner").append(temp);
          $(parent + "#owner").select2("data", {id: project_info.owner_id, text: project_info.owner_name});
          $(parent + "#description").val(project_info.description);
          $(parent + "#note").val(project_info.note);
          $("#modal-edit-project").modal('show');
          //Set project comment
          var comment = response.comment;
          getComment("#modal-edit-project", comment);
        }
      },error: function(response){
//        console.log(response);
        var err = jQuery.parseJSON(response.responseText);
        $("#modal-error-notice .error-content").html(err.error.message);
        $("#modal-error-notice").modal('show');
      }
    });
    event.preventDefault();
  });
})

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
              case 3:
                return "<span class='label label-warning'>Initially</span>";
                break;
            }
          },
          'aTargets': [5]
        },
        {
          "mRender": function(data, type, row) {
            $html = '<a href="' + row['pid'] + '" class="btn view_prj" rel="tooltip" title="View"><i class="icon-edit"></i></a>' +
                    '<a href="' + row['pid'] + '" class="btn set_prj" rel="tooltip" title="Set current"><i class="icon-ok"></i></a>';
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
      'oColVis': {
        "buttonText": "Change columns <i class='icon-angle-down'></i>"
      },
      'oTableTools': {
        //"sRowSelect": "single",
        "aButtons": [],
        //"sSelectedClass": 'row_selected',
      }
    };
    var oTable = $('#project-datatable').dataTable(opt);
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
          values: ['Completed', 'In progress', 'Suspend', 'Canceled']
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
}