import  countdown  from 'countdown'
const initCountdown = () => {
  const element = document.getElementById('countdown')
  if (element) {
    setInterval( () => {
      const remainder = countdown(new Date(element.dataset.endTime))
      const datestring =  remainder.hours + "h :" + remainder.minutes + "m :" + remainder.seconds + "s";
      element.innerHTML = datestring
    }, 1000)

  }
}

export { initCountdown }
