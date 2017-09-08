class User < ApplicationRecord
  has_secure_password
  validates :avatar_url, :about, :cover_letter, :role, presence: true
  validates :username, :email, presence: true, uniqueness: true
  has_many :skills

  has_many :friendships, :foreign_key => "user_id", :class_name => "Friendship"
  has_many :friends, :through => :friendships

  enum role: %w(default admin)
end
