class User < ApplicationRecord
  validates :password, :avatar_url, :about, :cover_letter, presence: true
  validates :username, :email, presence: true, uniqueness: true
  has_many :skills
end
