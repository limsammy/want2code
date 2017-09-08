require 'faker'
FactoryGirl.define do
  factory :user do
    username Faker::Internet.unique.user_name
    password Faker::Internet.password
    avatar_url Faker::Avatar.image
    email Faker::Internet.unique.email
    about "MyText"
    cover_letter "MyText"
    linkedin "MyString"
    github "MyString"
  end
end
