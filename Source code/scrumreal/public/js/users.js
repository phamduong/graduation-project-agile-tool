var userDatatables;
$(document).ready(function() {
  userDatatables = initUsersDatatable();
  var callback = function(topic, data) {
    if (topic === "scrum.realtime.user") {
      if (data.type === "remove_user") {
        userDatatables.fnReloadAjax();
      } else {
        userDatatables.fnReloadAjax();
      }
    }
  }

  subscribeToTopic(['scrum.realtime.user'], 'localhost', '8080', callback);
});
function initUsersDatatable() {
  var oTable;
  var sAjaxSource = "/user/datatables";
  var opt = {
    "sAjaxSource": sAjaxSource,
    "sDom": "<'row-fluid well-search'<'span5'Ti><'span2'f><'span5'pl><'clear'><'container-processing'r>>t<'row-fluid'<'span6'i><'span6'p>>",
    "sPaginationType": "full_numbers",
    "aoColumns": [
      {"mData": "user_name"},
      {"mData": "birthday"},
      {"mData": "project_name"},
      {"mData": "count_project"},
      {"mData": "uid"}
    ],
    'aoColumnDefs': [
      {
        'bSortable': false,
        'aTargets': [4]
      },
      {
        "mRender": function(data, type, row) {
          var html = '<div id="user_' + row['uid'] + '_ac"><a href="' + row['uid'] + '" class="btn view_user" rel="tooltip" title="View detail"><i class="icon-edit"></i></a>'
                  + '</div>';
          return html;
        },
        'aTargets': [4]
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
  oTable = $('#users_list_datatable').dataTable(opt);

  $('.dataTables_filter input').attr("placeholder", "Search here...");
  $(".dataTables_length select").wrap("<div class='input-mini'></div>").chosen({
    disable_search_threshold: 9999999
  });

  oTable.columnFilter({
    "sPlaceHolder": "head:after",
    'aoColumns': [
      {
        type: "text",
      },
      {
        type: "text",
      },
      {
        type: "text",
      },
      {
        type: "text",
      },
//      {
//        type: "text",
//      },
      null
    ]
  });
  $("#users_list_datatable").css("width", '100%');
  $('table#users_list_datatable > thead > tr:last-child').hide();

  var html = '<button id="advanceFilter" class="advance-filter mr10 pull-right"><i class="icon-filter"></i></button>';
  $('#users_list_datatable_wrapper > div.well-search > div:nth-child(3)').prepend(html);

  $('#advanceFilter').click(function() {
    $('table#users_list_datatable > thead > tr:last-child').toggle();
    if ($('#advanceFilter').hasClass('advance-filter-active')) {
      $('#advanceFilter').removeClass('advance-filter-active');
      // reset_dt_view(oTable);
    } else {
      $('#advanceFilter').addClass('advance-filter-active');
    }
  });
  return oTable;
}

//View user detail
$("#users_list_datatable").on("click", ".view_user", function(e) {
  e.preventDefault();
  var uid = $(this).attr("href");
  $.ajax({
    url: "/user/edit",
    type: "POST",
    data: {uid: uid},
    global: false,
    success: function(response) {
      if (response.status === 200) {
        loadFormEditUserData(response);
      } else {
        showAlertModal(response.message);
      }
    }, error: function(response) {
      var err = jQuery.parseJSON(response.responseText);
      showAlertModal(err.error.message);
//        $("#modal-error-notice .error-content").html(err.error.message);
//        $("#modal-error-notice").modal('show');
    }
  });
});

$("#btn-add-user").click(function() {
  $("#modal-add-user").modal("show");
});
