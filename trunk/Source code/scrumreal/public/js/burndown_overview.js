$(document).ready(function() {
  //Init all team chart
  initAllTeam(window.report_selected_sprint);
  //Init each team chart
  $.each(window.report_team_list, function(key, value) {
    initTeam(window.report_selected_sprint, value.tid);
  });

  $("#sprint-control-bar #sprint_filter").change(function() {
    goToBurnDown();
  });

  $("#sprint-control-bar #other_filter").change(function() {
    goToBurnDown();
  });

});