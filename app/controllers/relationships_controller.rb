class RelationshipsController < ApplicationController
  def create
    if current_user.following?(params[:user_id])
      head :unprocessable_entity
    else
      current_user.follow(params[:user_id])
      head :ok
    end

  end

  def destroy
    # HTTP Requestは文字列で渡ってくるので、存在チェックも兼ねて一度Userを取得してIDを渡す
    if current_user.following?(User.find(params[:user_id]).id)
      current_user.unfollow(params[:user_id])
      head :ok
    else
      head :unprocessable_entity
    end
  end
end
