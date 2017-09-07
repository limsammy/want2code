require 'rails_helper'

RSpec.feature "User creates a new account" do
  scenario "with valid attributes" do
    user_attributes = {
      username: "laurenf",
      password: "mypassword"
    }

    visit 'users/new'
    fill_in "user[username]", with: user_attributes[:username]
    fill_in "user[password]", with: user_attributes[:password]
    click_on "Create Account"
    
    user = User.last

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Welcome, #{user.username}")
    expect(page).to have_content("Successful login")
  end
end
