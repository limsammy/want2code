class SkillController < ActionController::Base
  def new
    user = User.find(params[:user_id])
    @skill = user.skills.new
  end

  def create
    user = User.find(params[:user_id])
    if user.skills.save
      flash[:message] = "#{user.skills.last.name} skill has been created!"
    else
      redirect_to new_skill_path
    end
  end
end