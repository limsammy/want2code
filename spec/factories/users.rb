FactoryGirl.define do
  factory :user do
    username Faker::Internet.user_name
    password Faker::Internet.password
    avatar_url Faker::Avatar.image
    email Faker::Internet.email
    about "MyText"
    cover_letter "MyText"
    linkedin "MyString"
    github "MyString"
  end
end
