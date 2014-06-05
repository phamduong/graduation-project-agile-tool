$(document).ready(function() {
  // Make taskbox sortable
  $(".task-box").sortable({
    connectWith: ".task-box",
    items: ".box-condensed",
    opacity: 0.7,
    placeholder: 'widget-placeholder',
    forcePlaceholderSize: true,
    tolerance: "pointer",
    dropOnEmpty: true,
    //containment: $(this).parent().parent(),
    start: function(event, ui) {
      // console.log($(this).parent().parent());
    },
    create: function(event, ui) {
      var limit = $(this).parent().parent();
      $(this).sortable("option", "containment", limit);
    },
    stop: function(event, ui) {
      caculateAllStory();
    }
  }).disableSelection();

  //Caculate height of stories
  caculateAllStory();

  //Select 2 me
  $("#sprint_filter").select2();
  $("#other_filter").select2({
    width: '250px'
  });

  //Choose sprint filter
  $("#sprint_filter").change(function() {
    var spid = $("#sprint_filter").select2("val");
    window.location = "/taskboard/" + spid + "/";
  });
  
  $("#other_filter").change(function(){
    var temp = $("#other_filter").select2("val");
    var spid = $("#sprint_filter").select2("val");
    var entity_id = temp.split("_")[0];
    var entity_type = temp.split("_")[1];
    var url = "/taskboard/" + spid + "/" + entity_type + "/" + entity_id + "/";
    window.location = url;
  });
});

function caculateAllStory() {
  var max_height;
  $.each($("#task-board .user-story .story_info"), function() {
    max_height = 0;
    $(this).parent().find(".story-tasks .task-box").each(function() {
      if ($(this).height() > max_height) {
//        console.log(max_height);
//        console.log($(this).height());
        max_height = $(this).height();
      }
    });
    if (max_height !== null && max_height !== 0) {
      $(this).find(".story-content").css("height", (max_height - 80));
    }
  });
}
