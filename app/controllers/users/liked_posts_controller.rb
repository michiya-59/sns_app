# frozen_string_literal: true

module Users
  class LikedPostsController < ApplicationController
    def index
      @user = User.find(params[:user_id])
      @posts = Post.where(id: @user.likes.pluck(:post_id))
    end
  end
end
