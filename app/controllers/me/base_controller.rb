# frozen_string_literal: true

module Me
  class BaseController < ApplicationController
    before_action :redirect_when_no_logged_in
  end
end
