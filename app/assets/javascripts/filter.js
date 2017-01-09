$(document).ready(function(){
  $('#filter-text').on('keyup', filterText)
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
  console.log('trying to filter')
  // $('#link:not(:contains(filter))').hide()
}
