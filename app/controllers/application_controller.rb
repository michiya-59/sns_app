class ApplicationController < ActionController::Base
  include(SessionsHelper)

  def logged_user_in
    returun if current_user

    redirect_to login_path
  end

end
