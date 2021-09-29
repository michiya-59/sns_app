class LikesController < ApplicationController
  before_action :logged_user_in
  
  def create
    @post = Post.find(params[:post_id])
    like = current_user.likes.create(post_id: @post.id)
    redirect_to @post
  end

  def destroy
    current_user.likes.find_by!(post_id: params[:post_id]).destroy
    redirect_to post_path(params[:post_id])
  end
end