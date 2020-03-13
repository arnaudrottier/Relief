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
if (card) {
  card.addEventListener( 'click', function() {
    card.classList.toggle('is-flipped');
  });
};

if (document.querySelector("#lineModal")) {
  document.querySelector("#lineModal").addEventListener("click", () => {
    document.querySelector('.onboard.simple_form').submit()
  })
};
