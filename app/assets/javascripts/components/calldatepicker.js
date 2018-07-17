let datePic = document.querySelector(".datepicker");
let calendar = document.querySelector(".time-picker");
calendar.hidden = true;

let clearButton = document.querySelector("#resetDate");
// clearButton.style.visibility = "hidden" // or "visible"

datePic.addEventListener('change', function() {
  console.log(datePic.getAttribute("value"))
  if (datePic.getAttribute("value") ) {
    calendar.hidden = false;
  }
})

clearButton.addEventListener("click", function() {
  calendar.hidden = true;
});


