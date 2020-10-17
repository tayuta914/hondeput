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
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
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
