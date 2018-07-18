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

