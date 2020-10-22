class PostsController < ApplicationController
  before_action :set_post,only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, expect: [:index]
  
  def index
    @posts = Post.includes(:user)
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user).order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.valid?
      @post.save
     return redirect_to post_path(@post), notice: "アウトプットを投稿しました。"
    else 
      render :new
    end
  end

  def edit
    if @post.user != current_user
      redirect_to posts_path, alert: '不正なアクセスです。'
    end
  end

  def update
    if @post.update(post_params)
     redirect_to posts_path(@post), notice: "アウトプット情報を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "アウトプットを削除しました。"
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :impression, :post)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
