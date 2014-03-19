$(document).ready(function(){
  $("#new_sign_up").submit(validateForm);
});

function validateForm(e){
  if (
    $(this).parsley().validate() === false
  )
    e.preventDefault();
}
