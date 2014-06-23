$(document).ready(function() {
  $("#sprint-control-bar #sprint_filter").val(window.report_selected_sprint);
  $("#sprint-control-bar #other_filter").val(window.report_selected_team);

  $("#sprint-control-bar #sprint_filter").change(function() {
    goToBurnDown();
  });

  $("#sprint-control-bar #other_filter").change(function() {
    goToBurnDown();
  });
  if (window.report_selected_team == 0) {
    //all team
    $(".report-detail-title").html("All team");
    $(".report-detail-content").attr("id", "flot-all-team");
    initAllTeam(window.report_selected_sprint);
  } else {
    //team
    $(".report-detail-title").html(window.report_selected_team_name);
    $(".report-detail-content").attr("id", "team_report_" + window.report_selected_team);
    initTeam(window.report_selected_sprint, window.report_selected_team);
  }
});