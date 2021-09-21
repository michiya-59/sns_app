class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if params[:user][:image_name]
      @user.image_name = "#{@user.id}.jpg"
      image = params[:user][:image_name]
      File.binwrite("public/user_images/#{@user.image_name}",image.read)
    end

    if @user.save
      login(@user)
      redirect_to root_url
      flash[:success] = '登録完了しました。'
    else
      render 'new'
    end
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

  def setting
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation,:image_name)
  end
end
