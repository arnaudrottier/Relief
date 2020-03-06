
let submitButton = document.querySelector("#room-chore-submit");
let formNotesField = document.querySelector('#room_chore_notes');
let modalNotesField = document.querySelector("#room-chore-notes");

submitButton.addEventListener('click', () => {
  modalNotesField.innerHTML = formNotesField.value;
})
