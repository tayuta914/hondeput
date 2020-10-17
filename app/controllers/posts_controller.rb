class PostsController < ApplicationController
  before_action :set_post,only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, expect: [:index]
  
  def index
    @posts = Post.includes(:user)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to post_path(@post)
  end

  def edit
  end

  def update
    @post.update(post_params)
    redirect_to posts_path(@post)
  end

  def destroy
    @post.destroy
    redirect_to posts_path
    # redirect_to user_path(post.user), notice: "アウトプットを削除しました。"
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :impression, :post)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
