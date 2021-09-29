class LikesController < ApplicationController
  before_action :redirect_when_no_logged_in

  def create
    @post = Post.find(params[:post_id])
    like = current_user.likes.create(post_id: @post.id)

    head :ok
  end

  def destroy
    current_user.likes.find_by!(post_id: params[:post_id]).destroy

    head :ok
  end
end
