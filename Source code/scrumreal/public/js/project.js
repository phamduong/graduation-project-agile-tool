$(document).ready(function() {
  initProjectDatatable();
})
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
                return "<span class='label label-important'>Delay</span>";
                break;
            }
          },
          'aTargets': [5]
        },
        {
          "mRender": function(data, type, row) {
            $html = '<a href="'+ row['pid'] +'" class="btn view_prj" rel="tooltip" title="View"><i class="icon-edit"></i></a>' +
                    '<a href="'+ row['pid'] +'" class="btn set_prj" rel="tooltip" title="Set current"><i class="icon-ok"></i></a>';
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