document.addEventListener('DOMContentLoaded', () => {
  const likeContainers = document.querySelectorAll('[data-like-container]')
  Array.from(likeContainers).forEach(likeContainer => {
    const likeButton = likeContainer.querySelector('[data-like]')
    const cancelLikeButton = likeContainer.querySelector('[data-like]')

    likeButton.addEventListener('ajax:success', () => {
      console.log('liked!')
      // TODO: Likeボタンを非表示にしてLikeCancelボタンを表示する
    })

    cancelLikeButton.addEventListener('ajax:success', () => {
      console.log('like canceled!')
      // TODO: LikeCancelボタンを非表示にしてLikeボタンを表示する
    })

    // TODO: Like済みかどうかを判定して、どちらを表示しておくかを処理する
  })
})
