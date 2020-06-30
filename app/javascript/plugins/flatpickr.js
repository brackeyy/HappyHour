import flatpickr from "flatpickr";

const calendar = () => {
  const inputs = document.querySelectorAll('.datepicker')
  if (inputs) {
    inputs.forEach((input)=>{
      flatpickr(inputs, {
        enableTime: true,
        dateFormat: "Y-m-d H:i",
        time_24hr: true
      });
    })
  }
}
  export { calendar }
