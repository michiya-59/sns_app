// 条件に応じて2つのボタン（Like, CancelLike）の表示を切り替える
const switching = (isLiked, likeButton, cancelLikeButton) => {
  if (isLiked) {
    likeButton.classList.add('h-hide')
    cancelLikeButton.classList.remove('h-hide')
  } else {
    likeButton.classList.remove('h-hide')
    cancelLikeButton.classList.add('h-hide')
  }
}

document.addEventListener('turbolinks:load', () => {
  const likeContainers = document.querySelectorAll('[data-like-container]')

  Array.from(likeContainers).forEach(likeContainer => {
    const likeButton = likeContainer.querySelector('[data-like]')
    const cancelLikeButton = likeContainer.querySelector('[data-cancel-like]')
    // それぞれのボタンが2個あるので、Countを表示しているDOMも2個ある
    const countSpans = likeContainer.querySelectorAll('[data-count]')
    // HACK: 文字列でBooleanが入っているのでevalしてBooleanに変換する
    const isLiked = eval(likeContainer.dataset.isLiked)

    likeButton.addEventListener('ajax:success', () => {
      Array.from(countSpans).forEach(countSpan => countSpan.innerHTML = eval(countSpan.innerHTML) + 1)
      switching(true, likeButton, cancelLikeButton)
    })
    cancelLikeButton.addEventListener('ajax:success', () => {
      Array.from(countSpans).forEach(countSpan => countSpan.innerHTML = eval(countSpan.innerHTML) - 1)
      switching(false, likeButton, cancelLikeButton)
    })

    // Like済みかどうかを判定して、どちらを表示しておくかを処理する
    switching(isLiked, likeButton, cancelLikeButton)
  })
})
