let datePic = document.querySelector(".datepicker");
let calendar = document.querySelector(".time-picker");
calendar.hidden = true;
let timeslots = document.querySelectorAll(".timeslot");
let setCall = document.getElementById("setCall");

let url = new URL(window.location.href );

datePic.addEventListener('change', function() {
  if (datePic.getAttribute("value") ) {
    calendar.hidden = false;
  }
})

timeslots.forEach(function(timeslot) {
  timeslot.addEventListener('click', function() {
    timeslots.forEach(function(time){
      time.classList.remove("time-selected");
    })
    console.log(event)
    timeslot.classList.add("time-selected");
  });
});

setCall.addEventListener('click', function() {
  let dateSelected = datePic.getAttribute("value");
  let timeSelected = document.querySelector(".time-selected").innerText;
  // console.log(dateSelected)
  // console.log(timeSelected)
  let base = new URL(window.location.href );

  base = base + "?day=" + encodeURIComponent(dateSelected) + "&time=" + encodeURIComponent(timeSelected);
  console.log(base)
  window.location = base;
})
