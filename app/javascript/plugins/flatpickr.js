import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css"

flatpickr(".datepicker", {
  altInput: true,
  altFormat: "F j, Y",
  dateFormat: "Y-m-d",
  minDate: "today",
})
