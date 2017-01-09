$(document).ready(function(){
  $(".edit-link").on('click', editLink);
})

function editLink(event){
  event.preventDefault()
  var linkid = $(this).parent().parent().data('id')
  window.location = "/links/" + linkid + '/edit'
}
