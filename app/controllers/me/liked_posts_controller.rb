# frozen_string_literal: true

module Me
  class LikedPostsController < Me::BaseController
    def show
      @user = User.find(params[:id])
      posts_id = Like.where(user_id: @user.id).pluck(:post_id)
      @liked_posts = Post.find(posts_id)
    end
  end
end
