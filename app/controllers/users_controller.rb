class UsersController < ApplicationController


  # def index
  #   @users = User.all
  # end

  def show

    if user_signed_in?
    @user = current_user
    else
      redirect_to root_path
    end
  end

  # def edit
  #   find_user
  # end

  # def update
  #   find_user
  #   @user = User.update(user_params)
  #   redirect_to user_path(@user)
  # end

  # private
  # def user_params
  #   params.require(:user).permit(:first_name, :last_name, :email, :password, :photo)
  # end

  # def find_user
  #   @user = current_user
    # @usser = User.find(params[])
  # end

end
