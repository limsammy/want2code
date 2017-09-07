class SkillsController < ActionController::Base
  def new
    @user = User.find(params[:user_id])
    @skill = @user.skills.new
  end

  def create
    user = User.find(params[:user_id])
    @skill = user.skills.new(skill_params)
    if @skill.save
      flash[:message] = "#{@skill.name} skill has been created!"
      redirect_to user_path(user)
    else
      redirect_to new_user_skill_path
    end
  end

  private

  def skill_params
    params.require(:skill).permit(:name, :level)
  end
end