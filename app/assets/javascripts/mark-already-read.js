$(document).ready(function(){

  $("#links-list").children().each(function() {
    var read = $(this).find('.link_read').text().split(": ")[1].substring(0,4)
    if (read == 'true') {
      $(this).addClass('read')
      var button = $(this).find('.mark-read')
      button.removeClass('mark-read')
      button.addClass('mark-unread')
      button.html("Mark Unread")

    }

  });
});
