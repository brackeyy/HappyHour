
const calcCrow = (lat1, lon1, lat2, lon2) => {
  var R = 6371; // km
  var dLat = toRad(lat2-lat1);
  var dLon = toRad(lon2-lon1);
  var lat1 = toRad(lat1);
  var lat2 = toRad(lat2);

  var a = Math.sin(dLat/2) * Math.sin(dLat/2) +
    Math.sin(dLon/2) * Math.sin(dLon/2) * Math.cos(lat1) * Math.cos(lat2);
  var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
  var d = R * c;
  return d;
}

// Converts numeric degrees to radians
const toRad = (Value) => {
    return Value * Math.PI / 180;
}


const distanceCalculation = () => {
  const map = document.querySelector(".distance-calc")
  const container = document.getElementById('dist-container')
  if (map) {
    const barPos = JSON.parse(map.dataset.markers)[0]
    navigator.geolocation.getCurrentPosition(function(position) {
      const userPos = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };
      const dist = calcCrow(barPos.lat, barPos.lng, userPos.lat, userPos.lng)
      const roundedDist = Math.round(dist * 100) / 100
      container.innerHTML = `${roundedDist}km away`
    })
  }
}


export { distanceCalculation }
