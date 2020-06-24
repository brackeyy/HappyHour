import  countdown  from 'countdown'
const initCountdown = () => {
  const element = document.getElementById('countdown')
  if (element) {
    setInterval( () => {
      const endDate = new Date(element.dataset.endTime)
      element.innerHTML = countdown(endDate).toString()
    }, 1000)

  }
}

export { initCountdown }
