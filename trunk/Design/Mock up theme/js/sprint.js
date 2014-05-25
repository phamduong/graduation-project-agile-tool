$(document).ready(function() {
    //Init dragable and dropable in people management page
    initStoryDragDrop();
    //Init scrollbar
    // $("#sprint-team-list").perfectScrollbar();
});

function sortStoryList() {
    var list_story_sortable = $(".sprint-story-list .scrollable");
    var list_story = $(".story", list_story_sortable);
    list_story.sort(function(a, b) {
        // console.log(a.getAttribute("data-value"));
        return a.getAttribute("data-value").toUpperCase() > b.getAttribute("data-value").toUpperCase();
    });
    // console.log(list_story);
    list_story_sortable.append(list_story);
}

function initStoryDragDrop() {
    //sort list story
    $(".sprint-story-list .scrollable").sortable({
        items: ".story",
        opacity: 0.7,
        placeholder: 'widget-placeholder-2',
        forcePlaceholderSize: true,
        tolerance: "pointer"
    });
    // there's the story and the release-stories
    var $story_list = $(".sprint-story-list"),
        $team = $(".sprint-teams .s-team");
    // let the story items be draggable
    $(".sprint-story-list .story").draggable({
        cancel: "a.ui-icon", // clicking an icon won't initiate dragging
        revert: "invalid", // when not dropped, the item will revert back to its initial position
        containment: "document",
        helper: "clone",
        cursor: "move"
    });
    $(".sprint-teams .story").draggable({
        cancel: "a.ui-icon", // clicking an icon won't initiate dragging
        revert: "invalid", // when not dropped, the item will revert back to its initial position
        containment: "document",
        helper: "clone",
        cursor: "move"
    });
    // let the release-stories be droppable, accepting the story items
    $team.droppable({
        accept: ".story",
        //activeClass: "ui-state-highlight",
        drop: function(event, ui) {
            $(this).append(ui.draggable);
        }
    });
    // let the story be droppable as well, accepting items from the release-stories
    $story_list.droppable({
        accept: ".story",
        // activeClass: "custom-state-active",
        drop: function(event, ui) {
            $(this).find(".scrollable").append(ui.draggable);
            sortStoryList();
            $(".story-list .scrollable").sortable("refresh");
        }
    });
}