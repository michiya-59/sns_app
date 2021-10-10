# frozen_string_literal: true

class SearchsController < ApplicationController
  def search
    @users = User.looks(params[:word])
    @posts = Post.looks(params[:word])
  end
end
