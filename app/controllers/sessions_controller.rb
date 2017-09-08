class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:message] = "Successful login"
      if @user.role == 'admin'
        flash[:message] = "You are an admin!"
      end
      redirect_to user_path(@user)
    else
      flash[:message] = "Invalid"
      render 'new'
    end
  end

  def destroy
    session.clear
    flash[:message] = "Goodbye"
    redirect_to root_path
  end
end
