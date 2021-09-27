class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    unless @post.liked_by?(current_user)
      like = current_user.likes.create(post_id: @post.id)
      redirect_to @post
    end
  end

  def destroy
    current_user.likes.find_by!(post_id: params[:post_id]).destroy
    redirect_to post_path(params[:post_id])
  end
end