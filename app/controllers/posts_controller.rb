class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(posts_params)
    if @post.save
      redirect_to posts_url,notice: '投稿しました。'
    else
      render 'new'
    end
  end

  def edit
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def posts_params
    params.require(:post).permit(:content)
  end
end
