$(document).ready(function(){
  $.get("http://dd-hotreads.herokuapp.com/api/v1/hotreads").then(markHotReads)
});

function markHotReads(hotReads) {
  $("#links-list").children().each(function() {
    var url = $(this).find('.link-url').text().split(": ")[1]
    if (url == hotReads[0]) {
      $(this).addClass('top-read')
    } else if(hotReads.includes(url)) {
      $(this).addClass('hot-read')
    }
  });
}
