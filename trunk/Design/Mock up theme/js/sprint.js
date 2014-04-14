$(document).ready(function() {
    //Init dragable and dropable in people management page
    initStoryDragDrop();
});
function sortStoryList() {
    var list_people_sortable = $(".story-list .scrollable");
    var list_people = $(".story", list_people_sortable);
    list_people.sort(function(a, b) {
        // console.log(a.getAttribute("data-value"));
        return a.getAttribute("data-value").toUpperCase() > b.getAttribute("data-value").toUpperCase();
    });
    // console.log(list_people);
    list_people_sortable.append(list_people);
}

function initStoryDragDrop(){
    //sort list people
    $(".story-list .scrollable").sortable({
        items: ".story",
        opacity: 0.7,
        placeholder: 'widget-placeholder-2',
        forcePlaceholderSize: true,
        tolerance: "pointer"
    });
    // there's the people and the release-stories
    var $people = $(".story-list"),
        $team = $(".release-stories");
    // let the people items be draggable
    $(".story-list .story").draggable({
        cancel: "a.ui-icon", // clicking an icon won't initiate dragging
        revert: "invalid", // when not dropped, the item will revert back to its initial position
        containment: "document",
        helper: "clone",
        cursor: "move"
    });
    // let the release-stories be droppable, accepting the people items
    $team.droppable({
        accept: ".story",
        //activeClass: "ui-state-highlight",
        drop: function(event, ui) {
            $(this).append(ui.draggable);
        }
    });
    // let the people be droppable as well, accepting items from the release-stories
    $people.droppable({
        accept: ".story",
        // activeClass: "custom-state-active",
        drop: function(event, ui) {
            $(this).find(".scrollable").append(ui.draggable);
            // sortStoryList();
            $(".story-list .scrollable").sortable("refresh");
        }
    });
}