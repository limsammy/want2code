class Skill < ApplicationRecord
  attr_accessor :user
  validates :name, :level, presence: true
  belongs_to :user, dependent: :destroy
end
