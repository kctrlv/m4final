var $newLinkTitle, $newLinkUrl;

$(document).ready(function(){
  function updateLinkToRead(event) {
    $('#link-' + this).addClass('read')
  }

  function updateLinkToUnread(event) {
    $('#link-' + this).removeClass('read')
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
    }).then(updateLinkToUnread);
  })
})
