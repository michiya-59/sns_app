class RelationshipsController < ApplicationController
  def create
    current_user.follow(params[:user_id])
    head :ok
  end

  def destroy
    current_user.unfollow(params[:user_id])
    head :ok
  end
end
