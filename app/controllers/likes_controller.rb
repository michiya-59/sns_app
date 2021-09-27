class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    unless @post.liked_by?(current_user)
      like = current_user.likes.create(post_id: @post.id)
      redirect_to @post
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    like = current_user.likes.find_by(post_id: @post.id)
    like.destroy
    redirect_to @post
  end
end