module SessionsHelper
  def current_user
    @user = User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end

  def current_admin?
    current_user && current_user.admin?
  end
end