// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------
import 'mapbox-gl/dist/mapbox-gl.css';

// External imports
import "bootstrap";
import { initAutocomplete } from '../plugins/init_autocomplete';
import { initMapbox } from '../plugins/init_mapbox';
import { initCountdown } from '../plugins/init_countdown';
import { distanceCalculation } from '../components/distance_calculation';
import { toggleHomePageButton } from '../components/toggle';
import  Swal  from 'sweetalert2'
import "../plugins/flatpickr"


// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
// import { initUpdateNavbarOnScroll } from '../components/navbar';



function sweetalert() {
  const confirmationBox = document.querySelector(".sweetalert")
  if (confirmationBox) {
    Swal.fire({
      icon: 'success',
      title: 'Your payment was successful.',
      showConfirmButton: false,
      timer: 3000
    })
  }
}


document.addEventListener('turbolinks:load', () => {
  initMapbox();
  initCountdown();
  distanceCalculation();
  toggleHomePageButton();
  sweetalert();
  // initUpdateNavbarOnScroll();
})

// progress bar
function progress(timeleft, timetotal, $element) {
    var progressBarWidth = timeleft * $element.width() / timetotal;
    $element.find('div').animate({ width: progressBarWidth }, timeleft == timetotal ? 0 : 1000, "linear").html(timeleft + " sec");
    if(timeleft > 0) {
        setTimeout(function() {
            progress(timeleft - 1, timetotal, $element);
        }, 1000);
    }
};

// progress((@offer.end_time - DateTime.now), (@offer.end_time - DateTime.now), $('#progressBar'));
progress(180, 180, $('#progressBar'));

initAutocomplete();


