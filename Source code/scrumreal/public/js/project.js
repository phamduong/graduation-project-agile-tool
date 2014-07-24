var oTable;
var current_project;
if (typeof current_role !== "undefined") {
  updateHTMLFollowRole(current_role);
}

function updateHTMLFollowRole(role) {
  if (role == 1) {
    $("#btn-add-project").css("display", "inline");
    $("#permission_link").css("display", "inline");
    $("#user_link").css("display", "inline");
  } else {
    $("#btn-add-project").css("display", "none");
    $("#permission_link").css("display", "none");
    $("#user_link").css("display", "none");
  }
}

$(document).ready(function() {
  //init plupload
  initProjectDatatable();
  //subscribe to realtime update
  var callback = function(topic, data) {
//    console.log(topic);
//    console.log(data);
    if (data.type === 'add') {
      var oTable = $("#project-datatable").dataTable();
      oTable.fnReloadAjax();
    } else if (data.type === 'update') {
      var oTable = $("#project-datatable").dataTable();
      oTable.fnReloadAjax();
    } else if (data.type === 'delete') {
      var oTable = $("#project-datatable").dataTable();
      oTable.fnReloadAjax();
    }
  };
  subscribeToTopic(["scrum.realtime_" + current_project + ".project"], 'localhost', '8080', callback);
  //Add user in project add modal
  $("#modal-add-project a.btn-add-user").click(function() {
    $("#selected-role").val($(this).attr('data-selected'));
    $("#modal-add-user").modal('show');
  });

  //Init select2 leader
  $("#leader1").select2({
    minimumInputLength: 2,
    ajax: {
      url: "project/get_leader",
      dataType: 'json',
      global: false,
      quietMillis: 800,
      data: function(term, page) {
        return {
          q: term
        };
      },
      results: function(data, page) {
        return {results: data};
      }
    }
  });

  //Init select2 owner
  $("#owner1").select2({
    minimumInputLength: 2,
    ajax: {
      url: "project/get_owner",
      dataType: 'json',
      global: false,
      quietMillis: 800,
      data: function(term, page) {
        return {
          q: term
        };
      },
      results: function(data, page) {
        return {results: data};
      }
    }
  });

  //Init select2 leader
  $("#leader2").select2({
    minimumInputLength: 2,
    ajax: {
      url: "project/get_leader",
      dataType: 'json',
      global: false,
      quietMillis: 800,
      data: function(term, page) {
        return {
          q: term
        };
      },
      results: function(data, page) {
        return {results: data};
      }
    }
  });

  //Init select2 owner
  $("#owner2").select2({
    minimumInputLength: 2,
    ajax: {
      url: "project/get_owner",
      dataType: 'json',
      global: false,
      quietMillis: 800,
      data: function(term, page) {
        return {
          q: term
        };
      },
      results: function(data, page) {
        return {results: data};
      }
    }
  });

  //Add new project
  $("#form-add-project").submit(function(event) {
    event.preventDefault();
    if ($(this).valid() === true) {
      var fileSelect = document.getElementById('project-attach-add');
      var files = fileSelect.files;
      var len = files.length;
      var formData = new FormData();
      var ext_arr = ['jpg', 'png', 'doc', 'docx', 'xls', 'xlsx', 'pdf', 'rar', 'zip'];
      var name_err = [];
      var count_form_data_ele = 0;
      if (len > 0) {
        for (var i = 0; i < len; i++) {
          var file = files[i];
          if (checkFileExtension(file.name, ext_arr) == true) {
            formData.append('attach[]', file, file.name);
            count_form_data_ele++;
          } else {
            name_err.push(file.name);
          }
        }
      }
      if (name_err.length > 0) {
        alert("Some file extension are not valid, pls check a again: " + name_err.toString());
      } else {
        var allow_out_view = 1;
        if ($("#form-add-project #allow_out_view").is(':checked') == false) {
          allow_out_view = 0;
        }
        $.ajax({
          url: "/project/add",
          type: "POST",
          data: $(this).serialize() + "&allow_out_view=" + allow_out_view,
          success: function(response) {
            if (response.status === 800) { //error
              showAlert(0, true, response.message);
            } else if (response.status === 200) {
              showAlert(1, true, response.message);
              if (count_form_data_ele > 0) {
                addAttach(formData, 1, response.pid);
              }
//              oTable.fnReloadAjax();
              setTimeout(function() {
                $("#modal-add-project").modal('hide');
                clearFormInput("#form-add-project");
              }, 1000);
            }
          }
        });
      }
    }
  });

  $("#form-edit-project").submit(function(e) {
    e.preventDefault();
    //get remove attach file
    var remove_attach_name = [];
    $("#form-edit-project .attach_files .file_attach").each(function() {
      if ($(this).css("display") == "none") {
        remove_attach_name.push($(this).find("a").html());
      }
    });
    if ($(this).valid() === true) {
      var fileSelect = document.getElementById('project-attach-update');
      var files = fileSelect.files;
      var len = files.length;
      var formData = new FormData();
      var ext_arr = ['jpg', 'png', 'doc', 'docx', 'xls', 'xlsx', 'pdf', 'rar', 'zip'];
      var name_err = [];
      var count_form_data_ele = 0;
      if (len > 0) {
        for (var i = 0; i < len; i++) {
          var file = files[i];
          if (checkFileExtension(file.name, ext_arr) == true) {
            formData.append('attach[]', file, file.name);
            count_form_data_ele++;
          } else {
            name_err.push(file.name);
          }
        }
      }
      var pid = $("#form-edit-project #pid").val();
      if (name_err.length > 0) {
        alert("Some file extension are not valid, pls check a again: " + name_err.toString());
      } else {
        var allow_out_view = 1;
        if ($("#modal-edit-project #allow_out_view").is(':checked') == false) {
          allow_out_view = 0;
        }
        $.ajax({
          url: "/project/save",
          type: "POST",
          data: $(this).serialize() + "&allow_out_view=" + allow_out_view,
          success: function(response) {
            if (response.status === 200) {
              showAlert(1, true, response.message);
              //attach new file
              if (count_form_data_ele > 0) {
                addAttach(formData, 1, pid);
              }
              //remove old file
              if (remove_attach_name.length > 0) {
                removeAttach(remove_attach_name, 1, pid);
              }

              setTimeout(function() {
                $("#modal-edit-project").modal('hide');
              }, 1000);

//              var oTable = $("#project-datatable").dataTable();
//              oTable.fnReloadAjax();
              setTimeout(function() {
                clearFormInput("#form-edit-project");
              }, 1000);
            }
          }
        });
      }
    }

  });

  //Delete project
  $("#modal-edit-project").on("click", ".delete-project", function(e) {
    e.preventDefault();
    var pid = $(this).attr("data-pid");
    if (pid !== "" && typeof pid !== "undefined") {
      bootbox.confirm("Are you sure you want to delete this project?", function(result) {
        if (result === true) {
          $.ajax({
            url: "/project/delete",
            type: "POST",
            data: {pid: pid},
            success: function(response) {
              if (response.status === 200) {
                showAlert(1, true, response.message);
                setTimeout(function() {
                  $("#modal-edit-project").modal('hide');
                }, 1000);
                var oTable = $("#project-datatable").dataTable();
                oTable.fnReloadAjax();
                setTimeout(function() {
                  clearFormInput("#form-edit-project");
                }, 1000);
              }
            }
          });
        }
      });
    }
  });

  //Delete project
  $("#modal-edit-project").on("click", ".complete-project", function(e) {
    e.preventDefault();
    var pid = $(this).attr("data-pid");
    bootbox.confirm("Are you sure you want to mark this project as complete?", function(result) {
      if (result === true) {
        if (pid !== "" && typeof pid !== "undefined") {
          $.ajax({
            url: "/project/complete",
            type: "POST",
            data: {pid: pid},
            success: function(response) {
              if (response.status === 200) {
                showAlert(1, true, response.message);
                setTimeout(function() {
                  $("#modal-edit-project").modal('hide');
                }, 1000);
                var oTable = $("#project-datatable").dataTable();
                oTable.fnReloadAjax();
                setTimeout(function() {
                  clearFormInput("#form-edit-project");
                }, 1000);
              } else {
                showAlertModal(response.message);
              }
            }
          });
        }
      }
    });
  });

  //Show modal add project
  $("#btn-add-project").click(function() {
    if (window.has_select_project === false) {
      showAlertModal("Please select working project!", "notice");
    } else {
      //clear old attach file
      $("#modal-add-project .attach").html('<input type="file" name="attach[]" id="project-attach-add" multiple/>');
      $("#modal-add-project").modal("show");
    }
  });

  //Edit project 
  $("#project-datatable").on("click", ".view_prj", function(event) {
    event.preventDefault();
    clearFormInput("#form-edit-project");
//    if (window.has_select_project === false) {
//      $("#modal-error-notice .error-content").html("Please select working project!");
//      $("#modal-error-notice").modal("show");
//    } else {
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
          $(parent + "#project_date_range").val(project_info.start_date + ' - ' + project_info.end_date_es);
          $(parent + "#status").val(project_info.status);
//          $(parent + "#leader").val(project_info.leader_id);
          //Because project owner is not on the list
//          var temp = '<option value="' + project_info.owner_name + '">' + project_info.owner_name + '</option>';
//          $(parent + "#owner").append(temp);
          if (project_info.leader_id !== null) {
            $(parent + "#leader2").select2("data", {id: project_info.leader_id, text: project_info.leader_name});
          }
          if (project_info.owner_id !== null) {
            $(parent + "#owner2").select2("data", {id: project_info.owner_id, text: project_info.owner_name});
          }
          $(parent + "#description").val(project_info.description);
          $(parent + "#note").val(project_info.note);
          $(parent + ".delete-project").attr("data-pid", project_info.pid);
          $(parent + ".complete-project").attr("data-pid", project_info.pid);
          if (project_info.allow_out_view == 1) {
            $("#modal-edit-project #allow_out_view").prop("checked", true);
          } else {
            $("#modal-edit-project #allow_out_view").prop("checked", false);
          }
          $(".attach_files").html("");
          $.each(response.attachment, function(key, val) {
            var link = '<div class="file_attach"><a href="' + val.taid + '" class="file_attach_link">' + val.name + '</a> <i class="glyphicon-remove_2 remove_attach"></i></div>';
            $(parent + ".attach_files").append(link);
          });
          //Set project comment
          var comment = response.comment;
          getComment("#modal-edit-project", pid, comment);

          getActivity("#modal-edit-project", 1, pid, 0, 10);

          $("#modal-edit-project").modal("show");
        }
      }, error: function(response) {
        var err = jQuery.parseJSON(response.responseText);
        showAlertModal(err.error.message);
      }
    });
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
          current_project = pid;
          current_role = response.rid;
          updateHTMLFollowRole(current_role)
          window.has_select_project = true;
        }
      }, error: function(response) {
        var err = jQuery.parseJSON(response.responseText);
        showAlertModal(err.error.message);
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
              case -1:
                return "<span class='label label-warning'>New</span>";
                break;
              case 0:
                return "<span class='label label-inverse'>Cancled</span>";
                break;
              case 1:
                return "<span class='label label-satgreen'>Active</span>";
                break;
              case 2:
                return "<span class='label label-info'>Complete</span>";
                break;
              case 3:
                return "<span class='label'>Pause</span>";
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
        //remove all tr has class row_selected
        $("#project-datatable tr").removeClass("row_selected");
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