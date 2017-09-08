class ChangeSkillTypeToInteger < ActiveRecord::Migration[5.1]
  def change
    change_column :skills, :level, :string
  end
end
