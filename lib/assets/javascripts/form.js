$(document).ready(function(){
  $("form").submit(validateForm);
});

function validateForm(e){
  if (
    $(this).parsley().validate() === false
  )
    e.preventDefault();
}
