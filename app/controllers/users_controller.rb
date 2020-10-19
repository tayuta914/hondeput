class UsersController < ApplicationController
  before_action :set_user,only: [:show, :edit, :update]
  before_action :authenticate_user!, expect: [:index]

  def index
    @users = User.all
  end

  def show
    @username = current_user.username
    @posts = current_user.posts
  end

  def edit
    if @user != current_user
      redirect_to user_path,alert: '不正なアクセスです。'
    end
  end

  def update
    if @user.update(user_params)
     redirect_to user_path(@user), notice: "ユーザーを更新しました。"
    else
      render :edit
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'ログアウトしました。'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :profile, :profile_image)
  end
end
