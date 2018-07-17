let datePic = document.querySelector(".datepicker");
let calendar = document.querySelector(".time-picker");
calendar.hidden = true;

datePic.addEventListener('change', function() {
  console.log(datePic.getAttribute("value"))
  if (datePic.getAttribute("value") ) {
    calendar.hidden = false;
  }
})

let timeslots = document.querySelectorAll(".timeslot");
console.log(timeslots)

timeslots.forEach(function(timeslot) {
  timeslot.addEventListener('click', function() {
    timeslots.forEach(function(time){
      timeslot.classList.remove("selected");
    })
    console.log(event)
    timeslot.classList.add("selected");
  });
});
