class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    find_user
  end

  def edit
    find_user
  end

  def update
    find_user
    @user = User.update(user_params)
    redirect_to user_path(@user)
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :photo)
  end

  def find_user
    @user = User.find(params[:id])
  end

end