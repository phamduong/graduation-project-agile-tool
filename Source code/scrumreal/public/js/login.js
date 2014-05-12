$(document).ready(function() {
  $("#frm_login").submit(function(event) {
    if ($('#frm_login').valid() === true) {
      event.preventDefault();
      $.ajax({
        url: "/login",
        type: "POST",
        data: $(this).serialize(),
        success: function(response) {
          if (response.status == 800) { //error
            showAlert(0, true, response.message);
          } else if (response.status === 200) {
            window.location = "/user-profile";
          }
        }
      });
    }
  });
});