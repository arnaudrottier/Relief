import "bootstrap";
import "../plugins/flatpickr"
require('./edit-modal');

$(function () {
  $('[data-toggle="popover"]').popover()
$('.popover-dismiss').popover({
  trigger: 'focus'
  })
})

let card = document.querySelector('.card-profile');
card.addEventListener( 'click', function() {
  card.classList.toggle('is-flipped');
});
