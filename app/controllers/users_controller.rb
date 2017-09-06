class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:message] = "#{@user.username}'s profile has been created"
      redirect_to user_path(@user)
    else
      flash[:message] = "User Profile not created"
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :avatar_url, :email, :about, :cover_letter, :city, :state)
  end
end
