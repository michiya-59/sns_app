class PostsController < ApplicationController
  before_action :set_post,only: [:edit,:update,:show,:destroy]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(posts_params)

    if @post.save
      redirect_to posts_url,notice: '投稿しました。'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @post.update(posts_params)
    redirect_to root_url
    flash[:success] = '編集完了しました'
  end

  def show
  end

  def destroy
    @post.destroy
    redirect_to root_url
    flash[:danger] = '投稿を削除しました。'
  end

  private

  def posts_params
    params.require(:post).permit(:content)
  end

  def set_post
    @post = current_user.posts.find(params[:id])
  end
end
