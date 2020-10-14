class PostsController < ApplicationController
  before_action :set_item,only: [:show, :edit, :update]
  
  def index
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
    redirect_to post_path(@post)
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :impression)
  end

  def set_item
    @post = Post.find(params[:id])
  end
end
