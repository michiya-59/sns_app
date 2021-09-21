class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])

    if user && user.authenticate(params[:session][:password])
      login(user)
      params[:session][:remember] == '1' ? remember(user) : forget(user)
      redirect_to root_url
      flash.now[:success] = 'ログインしました'
    else
      render 'new'
    end 
  end

  def destroy
    log_out
    redirect_to root_url
    flash.now[:danger] = 'ログアウトしました'
  end
end
