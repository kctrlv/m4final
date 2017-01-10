$(document).ready(function(){
  $('#filter-text').on('keyup', filterText)
  $('#filter-unread').on('click', filterUnread)
  $('#filter-read').on('click', filterRead)
});

function filterText(event) {
  var filter = $("#filter-text").val()
  $("#links-list").children().each(function() {
    var title = $(this).find('.link-title').text()
    var url = $(this).find('.link-url').text()
    if(title.includes(filter) || url.includes(filter)){
      $(this).show()
    } else {
      $(this).hide()
    }
  })
}

function filterUnread(event) {
  console.log('trying to show only unread')
}

function filterRead(event) {
  console.log('trying to show only read')
}
