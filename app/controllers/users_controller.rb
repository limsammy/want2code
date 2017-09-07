class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
    @skill = @user.skills.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:message] = "#{@user.username}'s profile has been created"
      @user.skills.create
      redirect_to new_user_skill_path
    else
      flash[:message] = "User Profile not created"
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      flash[:message] = "#{@user.username} updated!"
      redirect_to user_path(@user)
    else
      flash[:message] = "#{@user.username} not updated! Try again!"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :avatar_url, :email, :about, :cover_letter, :city, :state)
  end
end
