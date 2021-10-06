# frozen_string_literal: true

module Me
  class LikedPostsController < Me::BaseController
    def show
      @user = User.find(params[:id])
      @liked_posts = Post.where(id: current_user.likes.pluck(:post_id))
    end
  end
end
