$(document).ready(function() {
    initCalendar();
})

function initCalendar() {
    // Calendar (fullcalendar)
    var date = new Date();
    var d = date.getDate();
    var m = date.getMonth();
    var y = date.getFullYear();
    if ($('.calendar').length > 0) {
        var calendar = $('.calendar').fullCalendar({
            header: {
                left: '',
                center: 'prev,title,next',
                right: 'month,agendaWeek,agendaDay,today'
            },
            buttonText: {
                today: 'Today'
            },
            editable: true,
            events: [{
                title: 'All Day Event',
                start: new Date(y, m, 1)
            }, {
                title: 'Long Event',
                start: new Date(y, m, d - 5),
                end: new Date(y, m, d - 2)
            }, {
                id: 999,
                title: 'Repeating Event',
                start: new Date(y, m, d - 3, 16, 0),
                allDay: false
            }, {
                id: 999,
                title: 'Repeating Event',
                start: new Date(y, m, d + 4, 16, 0),
                allDay: false
            }, {
                title: 'Meeting',
                start: new Date(y, m, d, 10, 30),
                allDay: false
            }, {
                title: 'Lunch',
                start: new Date(y, m, d, 12, 0),
                end: new Date(y, m, d, 14, 0),
                allDay: false
            }, {
                title: 'Birthday Party',
                start: new Date(y, m, d + 1, 19, 0),
                end: new Date(y, m, d + 1, 22, 30),
                allDay: false
            }, {
                title: 'Click for Google',
                start: new Date(y, m, 28),
                end: new Date(y, m, 29),
                url: 'http://google.com/'
            }],
            selectable: true,
            selectHelper: true,
            select: function(start, end, allDay) {
                // var title = prompt('Event Title:');
                // if (title) {
                //     calendar.fullCalendar('renderEvent', {
                //             title: title,
                //             start: start,
                //             end: end,
                //             allDay: allDay
                //         }, true // make the event "stick"
                //     );
                // }
                // calendar.fullCalendar('unselect');
            },
            dayClick: function(date, allDay, jsEvent, view) {

                // if (allDay) {
                //     alert('Clicked on the entire day: ' + date);
                // } else {
                //     alert('Clicked on the slot: ' + date);
                // }
                // alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
                // alert('Current view: ' + view.name);
                // // change the day's background color just for fun
                // $(this).css('background-color', 'red');
            },
            eventRender: function(event, element) {
		        // console.log(element);
		    },
			dayRender: function(date, cell){
				if(date.getDay() == 0 || date.getDay() == 6){
					cell.css("background-color", "#FFFF75");
				}
			}
        });
        $(".fc-button-effect").remove();
        $(".fc-button-next .fc-button-content").html("<i class='icon-chevron-right'></i>");
        $(".fc-button-prev .fc-button-content").html("<i class='icon-chevron-left'></i>");
        $(".fc-button-today").addClass('fc-corner-right');
        $(".fc-button-prev").addClass('fc-corner-left');
    }
}

function viewDateDetail(date){
	// $('.calendar').fullCalendar('gotoDate', 2015, 0, 1);
}