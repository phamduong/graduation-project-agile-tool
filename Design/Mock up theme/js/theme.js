$(document).ready(function() {
    //User skill tag in add user modal
    $(".chosen-container").removeAttr('style').addClass('span12');
    $(".chosen-container").css('margin-left', '0px');
    $(".chosen-container .search-field input").removeAttr('style').addClass('span10');
    //Reply to a comment
    $(".comment-list").on("click", ".btn-reply-comment", function() {
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
        var form_id = $(this).parent().parent().parent().attr("id");
        $(reply_form).addClass("reply-comment-form").attr("id", "reply_to_" + form_id).html($(".reply-comment-form-temp").html()).appendTo($(this).parent().parent());
        $("#reply_to_" + form_id).find("textarea").focus();
    });
    $(".comment-list").on("click", ".cancel-reply-comment", function(e) {
        $(this).parent().parent().parent().find(".media-actions:first").css("display", "block");
        var parent_id = $(this).parent().parent().attr("id");
        $(".comment-list #" + parent_id).remove();
    });
});

function showStatus(id, status_type, content) {
    var text = "";
    switch (status_type) {
        case "info":
            text = '<span class="label label-info">' + content + '</span>';
            break;
        case "success":
            text = '<span class="label label-success">' + content + '</span>';
            break;
        case "warning":
            text = '<span class="label label-warning">' + content + '</span>';
            break;
        case "error":
            text = '<span class="label label-important">' + content + '</span>';
            break;
    }
    $("#" + id).find(".actions").append(text);
}

function showMessage(id, mes_type, content) {}