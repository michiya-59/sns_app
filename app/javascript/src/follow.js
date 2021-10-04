const switching = (isFollowed, followButton, unfollowButton) => {
  if (isFollowed) {
    followButton.classList.add('h-hidden')
    unfollowButton.classList.remove('h-hidden')
  } else {
    followButton.classList.remove('h-hidden')
    unfollowButton.classList.add('h-hidden')
  }
}

document.addEventListener('turbolinks:load', () => {
  const followContainer = document.querySelectorAll('[data-follow-container]')

  Array.from(followContainer).forEach(followContainer => {
    const followButton = followContainer.querySelector('[data-follow]')
    const unfollowButton = followContainer.querySelector('[data-unfollow]')
    const unfollowerCount = followContainer.querySelector('[data-unfollow-count]')
    const isFollowed = eval(followContainer.dataset.isFollowed)

    followButton.addEventListener('ajax:success', () => {
      unfollowerCount.innerHTML = eval(unfollowerCount.innerHTML) + 1
      switching(true, followButton, unfollowButton)
    })

    unfollowButton.addEventListener('ajax:success', () => {
      unfollowerCount.innerHTML = eval(unfollowerCount.innerHTML) - 1
      switching(false, followButton, unfollowButton)
    })
    switching(isFollowed, followButton, unfollowButton)
  })
})
