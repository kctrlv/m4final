var $newLinkTitle, $newLinkUrl;

$(document).ready(function(){
  $newLinkTitle = $("#link-title");
  $newLinkUrl  = $("#link-url");

  $("#new-link").on('submit', createLink);
})

function createLink (event){
  event.preventDefault();

  var link = getLinkData();

  $.post("/api/v1/links", link)
   .then( renderLink )
   .fail( displayFailure )
 }

function getLinkData() {
 return {
   title: $newLinkTitle.val(),
   url: $newLinkUrl.val(),
   user_id: $('a').attr('id')
 }
}

function renderLink(link){
  $("#links-list").append( linkHTML(link) )
  $(`*[data-id=${link.id}]`).find('.edit-link').on('click', editLink )
}

function linkHTML(link) {

    return `<div class='link' data-userid='${link.user_id}'data-id='${link.id}' id="link-${link.id}">
              <p class='link-title'>Title: ${ link.title }</p>
              <p class='link-url'>URL: ${ link.url }</p>

              <p class="link_read">
                Read?: ${ link.read }
              </p>
              <p class="link_buttons">
                <button class="mark-read">Mark as Read</button>
                <button class='edit-link'>Edit</button>
              </p>
            </div>`
}

function clearLink() {
  $newLinkTitle.val("");
  $newLinkUrl.val("");
}

function displayFailure(failureData){
  $('#notice').html("FAILED attempt to create new Link: " + failureData.responseText);
}
