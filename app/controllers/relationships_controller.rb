class RelationshipsController < ApplicationController
  def create
    if current_user.following?(params[:user_id])
      head :ok
    else
      current_user.follow(params[:user_id])
      head :ok
    end
    
  end

  def destroy
    if current_user.following?(params[:user_id])
      current_user.unfollow(params[:user_id]).destroy
      head :ok
    else
      head :ok
    end
  end
end