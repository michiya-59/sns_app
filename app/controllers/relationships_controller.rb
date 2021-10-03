class RelationshipsController < ApplicationController
  def create
    if current_user.following?(params[:user_id])
      redirect_to user_path(params[:user_id]) #フォローされていたらユーザのプロフィールにリダイレクト
    else
      current_user.follow(params[:user_id])
      redirect_to user_path(params[:user_id])
    end
  end

  def destroy
    if current_user.following?(params[:user_id])
      current_user.unfollow(params[:user_id]).destroy #フォローされていたら、フォローを外すようにしている
      redirect_to user_path(params[:user_id])
    else
      redirect_to user_path(params[:user_id])
  end
end