require 'rails_helper'

describe "Visitor registers a new user" do
  scenario "a visitor can create a new user" do
    visit '/users/new'

    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    name = Faker::Internet.user_name
    email = Faker::Internet.email
    password = Faker::Internet.password

    fill_in "user[first_name]", with: first_name
    fill_in "user[last_name]", with: last_name
    fill_in "user[email]", with: email
    fill_in "user[password]", with: password
    click_button "Create"

    expect(current_path).to eq("/users/#{User.last.id}")
    expect(page).to have_content(name)
    expect(page).to have_content(email)
    expect(page).to have_content(password)
    expect(User.count).to eq(1)
  end
end
