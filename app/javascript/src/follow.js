const switching = (isfollowed, follow_button, unfollow_button) => {
  if (isfollowed) {
    follow_button.classList.add('h-hidden')
    unfollow_button.classList.remove('h-hidden')
  } else {
    follow_button.classList.remove('h-hidden')
    unfollow_button.classList.add('h-hidden')
  }
}

document.addEventListener('turbolinks:load', () => {
  const followContainer = document.querySelectorAll('[data-follow-container]')

  Array.from(followContainer).forEach(followContainer => {
    const follow_button = followContainer.querySelector('[data-follow]')
    const unfollow_button = followContainer.querySelector('[data-unfollow]')
    const unfollower_count = followContainer.querySelector('[data-unfollow-count]')
    const isfollowed = eval(followContainer.dataset.isFollow)

    follow_button.addEventListener('ajax:success', () => {
      unfollower_count.innerHTML = eval(unfollower_count.innerHTML) + 1
      switching(false, follow_button, unfollow_button)
    })

    unfollow_button.addEventListener('ajax:success', () => {
      unfollower_count.innerHTML = eval(unfollower_count.innerHTML) - 1
      switching(true, follow_button, unfollow_button)
    })
    switching(isfollowed, follow_button, unfollow_button)
  })
})
