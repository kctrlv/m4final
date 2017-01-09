var $newLinkTitle, $newLinkUrl;

$(document).ready(function(){
  function updateLinkToRead(event) {
    $('#link-' + this).addClass('read')
    var button = $('#link-' + this).find('.mark-read')
    button.removeClass('mark-read')
    button.addClass('mark-unread')
    button.html("Mark Unread")
    button.parent().parent().find('.link_read').text("Read?: true")
  }

  function updateLinkToUnread(event) {
    $('#link-' + this).removeClass('read')
    var button = $('#link-' + this).find('.mark-unread')
    button.removeClass('mark-unread')
    button.addClass('mark-read')
    button.html("Mark as Read")
    button.parent().parent().find('.link_read').text("Read?: false")
  }

  $('#links-list').on('click', 'button.mark-read', function(){
    var $this = $(this);
    var linkId = $this.parents('.link').data('id');

    $.ajax({
      url: '/api/v1/links/' + linkId,
      method: 'PATCH',
      data: {read: true}
    }).then(updateLinkToRead.bind(linkId));
  })

  $('#links-list').on('click', 'button.mark-unread', function(){
    var $this = $(this);
    var linkId = $this.parents('.link').data('id');

    $.ajax({
      url: '/api/v1/links/' + linkId,
      method: 'PATCH',
      data: {read: false}
    }).then(updateLinkToUnread.bind(linkId));
  })
})
