$(document).ready(function() {
  //Save general info
  $("#frm-user-general").submit(function(event) {
    var id = "#" + $(this).attr("id");
    if (checkChange(id)) {
      if ($(this).valid() === true) {
        checkImageUpload("#uimage");
        var form_data = new FormData($(this)[0]);
        $.ajax({
          url: "/user/save",
          type: "POST",
          data: form_data,
          async: false,
          success: function(response) {
            if (response.status === 800) { //error
              showAlert(0, true, response.message);
            } else if (response.status === 200) {
              showAlert(1, true, response.message);
              reAssignVal(id);
            }
          },
          cache: false,
          contentType: false,
          processData: false
        });
      }
    }
    event.preventDefault();
  });
  //Save password
  $("#change_pass").submit(function(event) {
    if ($(this).valid() === true) {
      $.ajax({
        url: "/user/change-pass",
        type: "POST",
        data: $(this).serialize(),
        success: function(response) {
          if (response.status === 800) { //error
            showAlert(0, true, response.message);
          } else if (response.status === 200) {
            showAlert(1, true, response.message);
          }
        },
      });
    }
    event.preventDefault();
  });
});