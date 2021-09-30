class UsersController < ApplicationController
  before_action :redirect_when_no_logged_in, only: [:index, :show, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :following, :followers]

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
    @posts = @user.posts.where(user_id: @user.id)
  end

  def edit
  end

  def update
    if current_user == @user
      @user.update(user_params)
      redirect_to user_path(@user)
    else
      root_url
    end
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
    @users = @user.following
    render 'following'
  end

  def followers
    @users = @user.followers
    render 'followers'
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile_image)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
