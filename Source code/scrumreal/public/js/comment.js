function initComment() {
  //Click reply to a comment -> create reply comment form
  $(".comment-list").on("click", ".btn-reply-comment", function(event) {
    if ($(".comment-list .reply-comment-form").length > 0) {
      //$(".comment-list .reply-comment-form").remove();
      $.each($(".comment-list .reply-comment-form"), function() {
        $(this).parent().find(".media-actions:first").css("display", "block");
        $(this).remove();
      });
    }
    var height = $(this).parent().parent().height();
    var current_top = $(".comment-list").scrollTop();
    $(".comment-list").scrollTop(current_top + height);
    $(this).parent().css('display', 'none');
    var reply_form = document.createElement('div');
    //var form_id = $(this).parent().parent().parent().attr("id");
    var parent_id = $(this).attr("href");
    var container = $(this).attr("data-container");
    $(reply_form).addClass("reply-comment-form").attr("id", "reply_to_" + parent_id).html($(".reply-comment-form-temp").html()).appendTo($(this).parent().parent());
    //Set parent id, container form for submit
    $("#reply_to_" + parent_id + " form").attr("data-reply-to", parent_id);
    $("#reply_to_" + parent_id + " form").attr("data-container", container);
    $("#reply_to_" + parent_id + " form").find("textarea").focus();
    $("#reply_to_" + parent_id + " form").addClass("reply-comment-initialized");
    event.preventDefault();
  });

  //Click cancel reply to comment
  $(".comment-list").on("click", ".cancel-reply-comment", function() {
    $(this).parent().parent().parent().find(".media-actions:first").css("display", "block");
    var parent_id = $(this).parent().parent().attr("id");
    $(".comment-list #" + parent_id).remove();
  });

//  $("#tab-comment").on('click', '.btn-reply-comment-submit', function(event){
//    alert('test');
//    event.preventDefault();
//  })
  //Submit reply comment form
  //$(".reply-comment-initialized").on('submit', function(event) {
  $("#tab-comment").on('submit', '.reply-comment-initialized', function(event) {
    event.preventDefault();
    if ($(this).valid() === true) {
      //find entity id and entity type 
      var container = $(this).attr("data-container");
      var entity_id = $(container + " #entity_id").val();
      var entity_type = $(container + " #entity_type").val();
      var parent_id = $(this).attr('data-reply-to');
      var content = $(this).find("textarea").val();
      $.ajax({
        url: 'comment/reply',
        type: 'POST',
        data: {entity_id: entity_id, entity_type: entity_type, parent_id: parent_id, content: content},
        success: function(response) {
          if (response.status === 800) { //error
            showAlert(0, true, response.message);
          } else if (response.status === 200) {
            showAlert(1, true, response.message);
            //Update comment display
            $(".comment-temp .media").attr("id", response.cid);
            $(".comment-temp .content-comment").html(content);
            $(".comment-temp .time-comment").html(response.time);
            $(".comment-temp .btn-reply-comment").attr("data-container", container).attr("href", response.cid);
            //Append to parent comment
            $("#" + parent_id + " .media-body:first").append($(".comment-temp").html());
            $("#" + parent_id).find(".media-actions:first").css("display", "block"); //display reply button
            $("#reply_to_" + parent_id).remove();
            $("#" + parent_id + " #" + response.cid).show();
          }
        }
      });
    }
  });

  //Submit new comment form
  $("#tab-comment").on("submit", ".new-comment-form", function(event) {
    event.preventDefault();
    if ($(this).valid() === true) {
      var container = $(this).attr("data-container");
      var entity_id = $(container + " #entity_id").val();
      var entity_type = $(container + " #entity_type").val();
      var content = $(this).find("textarea").val();
      $.ajax({
        url: 'comment/add',
        type: 'POST',
        data: {entity_id: entity_id, entity_type: entity_type, content: content},
        success: function(response) {
          if (response.status === 800) { //error
            showAlert(0, true, response.message);
          } else if (response.status === 200) {
            showAlert(1, true, response.message);
            //Update comment display
            $(".comment-temp .media").attr("id", response.cid);
            $(".comment-temp .content-comment").html(content);
            $(".comment-temp .time-comment").html(response.time);
            $(".comment-temp .btn-reply-comment").attr("data-container", container).attr("href", response.cid);
            //Append to parent comment
            $(".comment-list").append($(".comment-temp").html());
//            $("#" + parent_id).find(".media-actions:first").css("display", "block"); //display reply button
//            $("#reply_to_" + parent_id).remove();
            $(".comment-list " + "#" + response.cid).show();
            $(container + " .new-comment-form textarea").val("");
          }
        }
      });
    }
  });
}

function getComment(selector, comment) {
  var com_tab = selector + " #tab-comment";
  $(com_tab + " .comment-list").html("");
  $(com_tab + " .new-comment-form").attr("data-container", com_tab); //store container for easily get entity_id and entity_type
  if (typeof comment.entity_id != "undefined" && typeof comment.entity_type != "undefined") {
    var html = '';
    $(com_tab + " #entity_id").val(comment.entity_id);
    $(com_tab + " #entity_type").val(comment.entity_type);
    $.each(comment.list, function(index, value) {
      if (typeof value != "undefined") {
        if (value.parent_id == null) {
          html = '<div class="media" id="' + value.cid + '">';
          html += '<a class="pull-left" href="#">'
          html += '<img src="data/image/user/' + value.user_image + '"></a>';
          html += '<div class="media-body">';
          html += '<h6 class="media-heading"><span class="user-comment">' + value.user_name + ' <small><span class="time-comment">' + value.time + '</span></small></h6>';
          html += '<p class="content-comment">' + value.content + '</p>';
          html += '<div class="media-actions">';
          html += '<a href="' + value.cid + '" class="btn btn-small btn-reply-comment" data-container="' + com_tab + '"><i class="icon-reply"></i> Reply</a>';
          html += '</div>';
          //children
          html += getChildComment(value.cid, comment.list, com_tab);
          delete comment.list[index];
          html += '</div>'; //media-body
          html += '</div>';
        }
      }
      $(com_tab + " .comment-list").append(html);
      html = '';
    });
    //Check to show or do not show load more button
//    if (typeof comment.count_from != "undefined") {
//      showLoadMore(com_tab, comment.count_from, comment.count);
//    }
  }
}

function getChildComment(cid, list_com, container) {
  var html = '';
  if (list_com.length === 0) {
    return html;
  }
  $.each(list_com, function(index, value) {
    if (typeof value != "undefined") {
      if (value.parent_id === cid) {
        html += '<div class="media" id="' + value.cid + '">';
        html += '<a class="pull-left" href="#">'
        html += '<img src="data/image/user/' + value.user_image + '"></a>';
        html += '<div class="media-body">';
        html += '<h6 class="media-heading"><span class="user-comment">' + value.user_name + ' </span><small><span class="time-comment">' + value.time + '</span></small></h6>';
        html += '<p class="content-comment">' + value.content + '</p>';
        html += '<div class="media-actions">';
        html += '<a href="' + value.cid + '" class="btn btn-small btn-reply-comment" data-container="' + container + '"><i class="icon-reply"></i> Reply</a>';
        html += '</div>';
        html += getChildComment(value.cid, list_com, container);
        delete list_com[index];
        html += '</div>'; //media-body
        html += '</div>';
      }
    }
  });
  return html;
}