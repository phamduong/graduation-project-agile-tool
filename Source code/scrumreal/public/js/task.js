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
});

function caculateAllStory() {
  $.each($("#task-board").find(".user-story td:first"), function(index, value) {
    var max_height = 0;
    $(this).parent().find(".story-tasks .task-box").each(function() {
      if ($(this).height() > max_height) {
        max_height = $(this).height();
      }
    })
//  var height = $("#" + id).parent().find(".story-tasks:first .task-box").height();
    if (max_height !== null) {
      $(this).find(".story-content").css("height", (max_height - 80));
    }
  });
}
