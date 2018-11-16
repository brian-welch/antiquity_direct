//= require rails-ujs
//= require_tree .



// Change my booking button color if booking confirmed
myBookingStatusArray = document.querySelectorAll('.my-booking-status');
myBookingStatusArray.forEach(function(element) {
  if (element.innerText === "confirmed"){
    console.log('fire!')
    element.classList.add('my-confirmed-booking');
  };
});


myBookingStatusArray = document.querySelectorAll('.my-booking-status');
myBookingStatusArray.forEach(function(element) {
  if (element.innerText === "declined"){
    element.classList.add('my-declined-booking');
  };
});


// Artifacts index filtering with select

artifact_filter_form = document.querySelector("#artifact_filter");
artifact_filter_select = document.querySelector('#artifact_type_id');

if (artifact_filter_form && artifact_filter_select) {
  document.querySelector("#artifact_filter_button").remove();

  artifact_filter_select.addEventListener("change", function(){
    artifact_filter_form.submit();
  })
}
