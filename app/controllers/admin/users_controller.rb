class Admin::CategoriesController < ApplicationController

  def index
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:message] = "User has been deleted"
      redirect_to users_path
    else
      flash[:message] = "User has NOT been deleted"
      redirect_to user_path(@user)
    end
  end
end