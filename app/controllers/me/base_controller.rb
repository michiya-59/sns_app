class Me::BaseController < ApplicationController
  before_action :redirect_when_no_logged_in
end
