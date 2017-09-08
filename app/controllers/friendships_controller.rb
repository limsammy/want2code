class FriendshipsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @user.friends << current_user
    redirect_to user_path(@user)
  end
  def create
    @user = User.find(params[:user_id])
    @user.friends << current_user
    redirect_to user_path(@user)
  end
end