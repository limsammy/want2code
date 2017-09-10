class UsersController < ApplicationController
  def index
    if logged_in?
      @users = User.all
    else
      redirect_to new_user_path
      flash[:message] = "Please log in."
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:message] = "#{@user.username} has been created. Don't forget to add some skills!"
      @user.skills.create
      redirect_to user_path(@user)
    else
      flash[:message] = "User Profile not created"
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
    @skill = @user.skills.new
    @skills = @user.skills
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
    params.require(:user).permit(:username, :password, :avatar_url, :email, :about, :cover_letter, :city, :state, :quote, :first_name, :last_name)
  end
end
