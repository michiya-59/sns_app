# frozen_string_literal: true

module Me
  class LikedPostsController < Me::BaseController
    def index
      @posts = Post.where(id: current_user.likes.pluck(:post_id))
    end
  end
end
