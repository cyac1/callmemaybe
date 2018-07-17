let datePic = document.querySelector(".datepicker");
let calendar = document.querySelector(".time-picker");
// calendar.hidden = true;

let clearButton = document.querySelector("#resetDate");
// clearButton.hidden = true;

datePic.addEventListener('change', function() {
  console.log(datePic.getAttribute("value"))
  if (datePic.getAttribute("value") ) {
    calendar.hidden = false;
  }
  // else {
  //   calendar.hidden = false;
  // }
})

// datePic.addEventListener('change', function() {
//   console.log(datePic.getAttribute("value"))
//   if (datePic.getAttribute("value") ) {
//     calendar.hidden = false;
//   }
//   // else {
//   //   calendar.hidden = false;
//   // }
// })
