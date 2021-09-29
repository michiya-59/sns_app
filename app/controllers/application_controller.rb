class ApplicationController < ActionController::Base
  include(SessionsHelper)

  def logged_user_in
    if current_user.nil?
      redirect_to login_path
    end
  end

end
