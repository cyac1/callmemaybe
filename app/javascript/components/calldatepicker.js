function initCallDatePicker() {
  if (document.getElementById("call-calendar")) {
    let datePic = document.querySelector(".datepicker");
    let calendar = document.querySelector(".time-picker");
    calendar.hidden = true;
    let timeslots = document.querySelectorAll(".timeslot");
    let setCall = document.getElementById("setCall");

    let url = new URL(window.location.href );

    let calls_replier = document.querySelectorAll(".calls-info");
    console.log(calls_replier)

    datePic.addEventListener('change', function() {
      if (datePic.getAttribute("value") ) {
        // Show a calendar with only the timeslots that are actually available
        // Look in "hidden" information for exisiting calls
        // Check if any of those match the "Attribute Value"
        // Add class "disabled" to the timeslots that are already booked

        // Find out what date user picked in input field and create Date out of it
        let userSelectedDate = new Date(datePic.getAttribute("value"))

        // Access existing calls of user and also create Dates out of it
        let dateArray = document.querySelectorAll(".calls-info")
        dateArray.forEach(function(element) {
          let bookedDate = new Date(element.innerHTML);

          // If picked date and any call date is the same, block a timeslot
          if (sameDay(bookedDate, userSelectedDate)) {
            console.log(bookedDate.getHours());
            let bookedSlot = document.querySelector(".slot-"+ bookedDate.getHours());
            console.log(bookedSlot)
            bookedSlot.classList.add("booked");
            bookedSlot.disabled = true
          }
        });


        calendar.hidden = false;
      }
    })

    timeslots.forEach(function(timeslot) {
      timeslot.addEventListener('click', function() {
        if (timeslot.hasClass("booked")) {
          timeslots.forEach(function(time){
              time.classList.remove("time-selected");
            })
            console.log(event)
            timeslot.classList.add("time-selected");
        };
      });
    });

    setCall.addEventListener('click', function(event) {

      event.preventDefault();

      let dateSelected = datePic.getAttribute("value");
      let timeSelected = document.querySelector(".time-selected").innerText;
      let base = new URL(window.location.href);

      base = base + "day=" + encodeURIComponent(dateSelected) + "&time=" + encodeURIComponent(timeSelected);

      $.ajax({
        url: base,
        type: 'PATCH',
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
        data:{date: dateSelected,
              time: timeSelected},
        success: function(data) {


          console.log(data);
        }
      });
      window.location = base;
    });
  }
};

export { initCallDatePicker };

function sameDay(d1, d2) {
  console.log(d1);
  console.log(d2);
  return d1.getFullYear() === d2.getFullYear() &&
    d1.getMonth() === d2.getMonth() &&
    d1.getDate() === d2.getDate();
}
