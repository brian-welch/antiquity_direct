//= require rails-ujs
//= require_tree .



// Change my booking button color if booking confirmed
myBookingStatusArray = document.querySelectorAll('.my-booking-status');
myBookingStatusArray.forEach((element) => {
  if (element.innerText === "confirmed"){
    console.log('fire!')
    element.classList.add('my-confirmed-booking');
  };
});


myBookingStatusArray = document.querySelectorAll('.my-booking-status');
myBookingStatusArray.forEach((element) => {
  if (element.innerText === "declined"){
    element.classList.add('my-declined-booking');
  };
});
