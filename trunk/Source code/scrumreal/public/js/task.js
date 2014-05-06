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
        stop: function( event, ui ) {
        	// caculateAllStory();
        	caculateStoryHeight("story1");
        }
    }).disableSelection();

    //Caculate height of stories
    // caculateAllStory();
    caculateStoryHeight("story1");
});

function caculateAllStory(){
	$.each($("#task-board").find(".user-story"), function(index, value) {
		caculateStoryHeight(value.getAttribute("id"));
	});
}

function caculateStoryHeight(id) {
    var height = $("#" + id).parent().find(".story-tasks:first").height();
    console.log(height);
    if(height !== null){
    	$("#" + id).find(".story-content").css("height", (height - 80));
    }
}