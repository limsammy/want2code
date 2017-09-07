class Skill < ApplicationRecord
  validates :name, :level, presence: true
  belongs_to :user, dependent: :destroy
end
