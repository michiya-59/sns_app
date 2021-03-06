# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include(SessionsHelper)

  def redirect_when_no_logged_in
    return if current_user

    redirect_to login_path
  end
end
