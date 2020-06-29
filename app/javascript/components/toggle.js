const moveBall = () => {
  const ball = document.querySelector('.ball')
  const forUsers = document.querySelector('.sides.left')
  const forOwners = document.querySelector('.sides.right')
  ball.classList.toggle('active')
  forUsers.classList.toggle('active')
  forOwners.classList.toggle('active')
};

const changeOpacity = () => {
  const userTab = document.querySelector('.user-tab')
  const ownerTab = document.querySelector('.owner-tab')
  userTab.classList.toggle('opacity')
  ownerTab.classList.toggle('opacity')
};

const toggleHomePageButton = () => {
  const toggler = document.querySelector('.toggle-button')
  if (toggler) {
    toggler.addEventListener('click', moveBall);
    toggler.addEventListener('click', changeOpacity);
  }
}

export { toggleHomePageButton }
