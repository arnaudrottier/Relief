import "bootstrap";
import "../plugins/flatpickr"
require('./edit-modal');

$(function () {
  $('[data-toggle="popover"]').popover()
$('.popover-dismiss').popover({
  trigger: 'focus'
  })
})
