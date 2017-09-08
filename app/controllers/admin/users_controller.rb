class Admin::UsersController < Admin::BaseController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @skill = @user.skills.new
    @skills = @user.skills.all
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