$(document).ready(function() {
    //sort list people
    $(".people-list .scrollable").sortable({
        items: ".person",
        opacity: 0.7,
        placeholder: 'widget-placeholder-2',
        forcePlaceholderSize: true,
        tolerance: "pointer"
    });

    // there's the people and the team-members
    var $people = $(".people-list"),
        $team = $(".team-members");
    // let the people items be draggable
    $(".people-list .person").draggable({
        cancel: "a.ui-icon", // clicking an icon won't initiate dragging
        revert: "invalid", // when not dropped, the item will revert back to its initial position
        containment: "document",
        helper: "clone",
        cursor: "move"
    });
    // let the team-members be droppable, accepting the people items
    $team.droppable({
        accept: ".person",
        //activeClass: "ui-state-highlight",
        drop: function(event, ui) {
        	$(this).append(ui.draggable);
        }
    });
    // let the people be droppable as well, accepting items from the team-members
    $people.droppable({
        accept: ".person",
        // activeClass: "custom-state-active",
        drop: function(event, ui) {
            $(this).find(".scrollable").append(ui.draggable);
            sortPeopleList();
            $(".people-list .scrollable").sortable("refresh");
        }
    });

    function sortPeopleList(){
        var list_people_sortable = $(".people-list .scrollable");
        var list_people = $(".person", list_people_sortable);

        list_people.sort(function(a ,b){
            // console.log(a.getAttribute("data-value"));
            return a.getAttribute("data-value").toUpperCase() > b.getAttribute("data-value").toUpperCase();
        });
        // console.log(list_people);
        list_people_sortable.append(list_people);
    }
    // TESTING ONLY
    showStatus("team1", "error", "errrrr");
});