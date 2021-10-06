# frozen_string_literal: true

module Users
  class LikedPostsController < ApplicationController
    def index
      @posts = Post.where(id: User.find(params[:user_id]).likes.pluck(:post_id))
    end
  end
end
