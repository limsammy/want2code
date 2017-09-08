class User < ApplicationRecord
  has_secure_password
  validates :password, :avatar_url, :about, :cover_letter, presence: true
  validates :username, :email, presence: true, uniqueness: true
  has_many :skills

  has_many :friendships, :foreign_key => "user_id", :class_name => "Friendship"
  has_many :friends, :through => :friendships
end
