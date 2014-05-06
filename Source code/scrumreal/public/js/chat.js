/* init */
function initChat() {
	/*
	 * Global var
	 */
	// URL_MESSAGE = "/WebChat/api/message";
	// URL_USER = "/WebChat/account";
	// URL_HISTORY = "/WebChat/history";
	messageHistoryIndex = [];
	isLoading = [];

	countUserOnline = 0;

	// group message
	groupFrom = [];
	groupTo = [];
	groupLoadMoreFrom = [];
	groupLoadMoreTo = [];

	// id
	// id = $('#myID').val();

	// init polling
	// pollUserOnline(updateListUser);
	// pollMessage(id, updateChatArea);
	// getNotification(id, showNotification);

	// window.onunload = quit;
	// window.onbeforeunload = quit;

	// Max chatbox height
	maxCHeight = $(window).height() - 100;
	// Max chatbox width
	maxCWidth = $(window).width() - 400;

	// Array contains all all_chatboxes
	all_chatboxes = new Array();
	//Array store previous cookie
//	preCookie = new Array();

	// List order and visible chatboxes
//	if(readCookie("dbcookies") != null){
//		listCbOrder = readCookie("dbcookies").split(",");
//	}else{
//		listCbOrder = new Array();
//	}
	listCbOrder = new Array();
	// Array contain chatboxes' width before minimize
	listCbWidth = {};

	// Chatbox input length
	inputLength = 187;

	// List notify box
	listNotify = new Array();

	// Whether or no the server is procressing message
	isProcess = true;
}

//Define chatbox's size
var CHATBOX_WIDTH = 260;
var CHATBOX_HEIGHT = 326;

// User select to chat with another user
function chatWith(idTo, chatboxtitle) {
	createChatBox(idTo, chatboxtitle);
}

// Count number of visible all_chatboxes
function countVisibleall_chatboxes() {
	var all_chatboxes_length = 0;
	var allBoxes = all_chatboxes.length; // Number of all all_chatboxes
	for ( var i = 0; i < allBoxes; i++) {
		if ($("#chatbox_" + all_chatboxes[i]).css("display") != "none") {
			all_chatboxes_length++;
		}
	}
	return all_chatboxes_length;
}

function createChatBox(idTo, chatboxtitle){
	// If chat box has exist and minimized resume it else if it is not minimized -> focus on it
	if ($("#chatbox_" + idTo).length > 0) {
		reStructureall_chatboxes();
		//If closed
		if ($("#chatbox_" + idTo).css("display") == "none"
				&& $("#chatbox_" + idTo + " .slimScrollDiv").css("display") != "none") {
			rightPos = caculateRightPos();
			$("#chatbox_" + idTo).css("right", rightPos + "px");
			listCbOrder.push(idTo);
			//Save to cookie
			//setCookie("dbcookies", listCbOrder, 0.5);
			$("#chatbox_" + idTo + " .slimScrollDiv").css("display", "block");
			$("#chatbox_" + idTo).resizable("enable");
			$("#chatbox_" + idTo).css("width", CHATBOX_WIDTH + "px");
			// $("#chatbox_" + idTo + " .chatboxcontent").css("height", 247 + "px");
			$("#chatbox_" + idTo).css("display", "block");
			// $("#txt_" + idTo).html("");
		}//If minimized 
		else if ($("#chatbox_" + idTo).css("display") != "none"
				&& $("#chatbox_" + idTo + " .slimScrollDiv").css("display") == "none") {
			toggleChatBoxGrowth(idTo);
			$("#txt_" + idTo).html("");
		} else {
			if ($("#txt_" + idTo).is(":focus") == false) {
				$("#txt_" + idTo).focus();
			}
		}
		return;
	}
	 $("<div>")
            .attr("id", "chatbox_" + idTo)
            .addClass("chatbox")
            .html('<div class="">' +
                        '<div class="box box-color box-bordered blue box-small">' +
                            '<div class="box-title"><h3><i class="icon-comment"></i>Chat</h3>' +
                                '<div class="actions">' +
                                	'<a href="#" class="btn btn-mini content-slideUp" onclick="javascript:toggleChatBoxGrowth(\''+ idTo+ '\')"><i class="icon-angle-down"></i></a>' +
                                    '<a href="#" class="btn btn-mini content-remove" onclick="javascript:closeChatBox(\''+ idTo+ '\')"><i class="icon-remove"></i></a>' +
                                '</div>' +
                            '</div>' +
                            '<div class="box-content nopadding scrollable" data-height="300" data-visible="true" data-start="bottom">' +
                                '<ul class="messages">' +
                                    '<li class="left">' +
                                        '<div class="image">' +
                                            '<img src="img/demo/user-1.jpg" alt="">' +
                                        '</div>' +
                                        '<div class="message">' +
                                            '<span class="caret"></span>' +
                                            '<span class="name">Jane Doe</span>' +
                                            '<p>Lorem ipsum aute ut ullamco et nisi ad. </p>' +
                                            '<span class="time">12 minutes ago</span>' +
                                        '</div>' +
                                    '</li>' +
                                    '<li class="right">' +
                                        '<div class="image">' +
                                            '<img src="img/demo/user-2.jpg" alt="">' +
                                        '</div>' +
                                        '<div class="message">' +
                                            '<span class="caret"></span>' +
                                            '<span class="name">John Doe</span>' +
                                            '<p>Lorem ipsum aute ut ullamco et nisi ad. Lorem ipsum adipisicing nisi Excepteur eiusmod ex culpa laboris. Lorem ipsum est ut...</p>' +
                                            '<span class="time">' +
                                            '12 minutes ago' +
                                            '</span>' +
                                        '</div>' +
                                    '</li>' +
                                    '<li class="left">' +
                                        '<div class="image">' +
                                            '<img src="img/demo/user-1.jpg" alt="">' +
                                        '</div>' +
                                        '<div class="message">' +
                                            '<span class="caret"></span>' +
                                            '<span class="name">Jane Doe</span>' +
                                            '<p>Lorem ipsum aute ut ullamco et nisi ad. Lorem ipsum adipisicing nisi!</p>' +
                                            '<span class="time">12 minutes ago</span>' +
                                        '</div>' +
                                    '</li>' +
                                    '<li class="typing">' +
                                        '<span class="name">John Doe</span> is typing <img src="img/loading.gif" alt="">' +
                                    '</li>' +
                                    '<li class="insert">' +
                                        '<form id="message-form" method="POST" action="#">' +
                                            '<div class="text">' +
                                                '<input type="text" name="text" placeholder="Write here..." class="input-block-level">' +
                                            '</div>' +
                                            '<div class="submit">' +
                                                '<button type="submit"><i class="icon-share-alt"></i></button>' +
                                            '</div>' +
                                        '</form>' +
                                    '</li>' +
                                '</ul>' +
                            '</div>' +
                        '</div>' +
                    '</div>')
            .appendTo($("body"));
    // Place new chatbox on browser
	if(listCbOrder.indexOf(idTo) == -1){
		rightPos = caculateRightPos();
		$("#chatbox_" + idTo).css("right", rightPos + "px");
	}else{ //If preLoad chatboxes
		var i = listCbOrder.indexOf(idTo);
		if (i == 0) {
			if (parseInt($("#list_friend_title").css("right")) < 0) {
				$("#chatbox_" + listCbOrder[i]).css("right", "20px");
				rightPos = 20;
			} else {
				$("#chatbox_" + listCbOrder[i]).css("right", "283px");
				rightPos = 283;
			}

		} else {
			rightPos += (parseInt($("#chatbox_" + listCbOrder[i - 1]).css("width")) + 7);
			$("#chatbox_" + listCbOrder[i]).css("right", rightPos + "px");
		}
	}
	// Add new chatbox to array which holding chatbox list
	all_chatboxes.push(idTo);

	if(listCbOrder.indexOf(idTo) == -1){
		// Add chat box to order and visible chat boxes
	//console.log("truoc khi push" + listCbOrder.toString());
		listCbOrder.push(idTo);
	//console.log("sau khi push" + listCbOrder.toString());
		//Save to cookie
	//setCookie("dbcookies", listCbOrder, 0.5);
	}
    //Make new chatbox scrollable
	var $el = $("#chatbox_" + idTo + " .scrollable");
    var height = parseInt($el.attr('data-height'));
    vis = ($el.attr("data-visible") == "true") ? true : false;
    start = ($el.attr("data-start") == "bottom") ? "bottom" : "top";
    var opt = {
        height: height,
        color: "#666",
        start: start,
        allowPageScroll:false
    };
    if (vis) {
        opt.alwaysVisible = true;
        opt.disabledFadeOut = true;
    }
    $el.slimScroll(opt);
     // Make chatbox resizable
    $("#chatbox_" + idTo)
                .resizable(
                    {
                        handles : "n, w, nw",
                        maxHeight : maxCHeight,
                        maxWidth : maxCWidth,
                        minHeight : 326,
                        minWidth : 260,
                        start : function(event, ui) {
                            // Prevent chatbox from jumping on website
                            $("#chatbox_" + idTo).css({
                                    "top" : "",
                                    "left" : ""
                            });
                        },
                        resize : function(event, ui) {
                            // Prevent chatbox from jumping on website
                            $("#chatbox_" + idTo).css({
                                    "top" : "",
                                    "left" : "",
                            });
                            var handles = $("body").css("cursor");
                            // Do not resize chatbox's height when resize width
                            if (handles != "w-resize") {
                                var content_height = parseInt($(
                                                "#chatbox_" + idTo).css("height")) - 80;
                                $("#chatbox_" + idTo + " .chatboxcontent").css(
                                                "height", content_height + "px");
                            }// When resize width of 1 chatbox redisplay the
                            // others on left side of this
                            if (handles == "w-resize" || handles == "nw-resize") {
                                var resizeW = parseInt($("#chatbox_" + idTo).css("width"))- ui.prevWidth;
                                var i = listCbOrder.indexOf(idTo) + 1;
                                // If there are some chatboxes one left side of
                                // current chat box
                                if (i < listCbOrder.length) {
                                    while (i < listCbOrder.length) {
                                        $("#chatbox_" + listCbOrder[i]).css(
                                                        "right", "+=" + resizeW + "px");
                                        i++;
                                    }
                                }
                            }
                        },
                        // Prevent chatbox from jumping on website
                        stop : function(event, ui) {
                            inputLength = $("#txt_" + idTo).css("width");
                            $("#chatbox_" + idTo).css({
                                    "top" : "",
                                    "left" : "",
                                    "height" : ""
                            });
                        }
                    });
	$("#chatbox_" + idTo).show();
}

// Toggle chat box size if it is minimized
function toggleChatBoxGrowth(idTo) {
	// Show chatbox
	if ($("#chatbox_" + idTo + " .slimScrollDiv").css("display") == "none") {
		$("#chatbox_" + idTo).css("width", listCbWidth[idTo]);
		reStructureall_chatboxes();
		$("#chatbox_" + idTo).resizable("enable");
		$("#chatbox_" + idTo + " .slimScrollDiv").css("display", "block");
		// if ($("#txt_" + idTo).is(":focus") == false) {
		// 	$("#txt_" + idTo).focus();
		// }
	}
	// Minimize chatbox
	else {
		$("#chatbox_" + idTo + " .slimScrollDiv").css({
			"display" : "none"
		});
		// Store chatbox's width before minimize it
		listCbWidth[idTo] = $("#chatbox_" + idTo).css("width");
		$("#chatbox_" + idTo).css("width", 200);
		// Disable resizable when minimize chatbox
		$("#chatbox_" + idTo).resizable("disable");

		reStructureall_chatboxes();
	}
}

// Close chatbox
function closeChatBox(idTo) {
	$("#chatbox_" + idTo).css("display", "none");
	var idb= "";
	var index = listCbOrder.indexOf(idTo);
	//Focus on another chatbox
	if(listCbOrder[index+1] != null){
		idb = listCbOrder[index+1];
		$("#cb_in_" + listCbOrder[index+1]).focus();
	}else if(listCbOrder[index+-1] != null){
		idb = listCbOrder[index - 1];
	}
	listCbOrder.splice(index, 1);
	//Save to cookie
	//setCookie("dbcookies", listCbOrder, 0.5);
	reStructureall_chatboxes();
	$("#txt_" + idb).focus();
	// console.log("Danh sach chatbox theo thu tu khi tat chat box:" +
	// listCbOrder);+
}

// Restruct all all_chatboxes
function reStructureall_chatboxes() {
	var rightPos = 0;
	for ( var i = 0; i < listCbOrder.length; i++) {
		if (i == 0) {
			// if (parseInt($("#list_friend_title").css("right")) < 0) {
			// 	$("#chatbox_" + listCbOrder[i]).css("right", "20px");
			// 	rightPos = 20;
			// } else {
			// 	$("#chatbox_" + listCbOrder[i]).css("right", "283px");
			// 	rightPos = 283;
			// }
			$("#chatbox_" + listCbOrder[i]).css("right", "0px");
			rightPos = 0;

		} else {
			rightPos += (parseInt($("#chatbox_" + listCbOrder[i - 1]).css("width")) + 7);
			$("#chatbox_" + listCbOrder[i]).css("right", rightPos + "px");
		}
	}
}

function caculateRightPos() {
	var rightPos = 0;
	for ( var i = 0; i < listCbOrder.length; i++) {
		rightPos += (parseInt($("#chatbox_" + listCbOrder[i]).css("width")) + 7);
	}
	return rightPos;
}