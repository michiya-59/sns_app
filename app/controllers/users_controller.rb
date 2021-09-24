class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    # XXX: 確認画面を挟んでるのでシリアライズできず、tmpに入ったものを開き直してる、あんまり良くない
    @user = User.new(user_params.merge(profile_image: File.open(user_params[:profile_image])))

    if @user.save
      login(@user)
      redirect_to root_url
      flash[:success] = '登録完了しました。'
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.where(user_id: @user.id)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def user_confirm_new
    @user = User.new(user_params)
    unless @user.valid?
      render 'new'
    end
  end

  def following
    @title = 'フォロー中'
    @zero_msg = '誰もフォローしていません'
    @user = User.find(params[:id])
    @users = @user.following
    render 'show_follow'
  end

  def followers
    @title = 'フォロワー'
    @zero_msg = '誰にもフォローされていません'
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end

  def setting
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile_image)
  end
end
