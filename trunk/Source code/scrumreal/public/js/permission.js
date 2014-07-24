$("#save-permission").click(function(e) {
  e.preventDefault();
  var data = {};
  $.each($(".check_permission"), function() {
    if ($(this).prop("checked")) {
      data[$(this).val()] = 1;
    } else {
      data[$(this).val()] = 0;
    }
  });
  $.ajax({
    url: "permission/save",
    type: "POST",
    data: data,
    success: function(response) {
      showAlertModal(response.message, "success");
    }, error: function(response) {
      showAlertModal(response.message);
    }
  });
});