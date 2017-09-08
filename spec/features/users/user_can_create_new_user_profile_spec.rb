require 'rails_helper'

describe "User creates a new user profile" do
  scenario "a user can create a new user profile" do
    visit '/users/new'

    fill_in "user[username]", with: "JohnDoe"
    fill_in "user[password]", with: "Password123"
    fill_in "user[avatar_url]", with: "img.jpg"
    fill_in "user[email]", with: "email@email.com"
    fill_in "user[about]", with: "I'm a user and I'm here to get a job"
    fill_in "user[cover_letter]", with: "I'm a real go-getter"
    fill_in "user[city]", with: "Denver"
    fill_in "user[state]", with: "Colorado"
    click_button "Create"

    expect(current_path).to eq("/users/#{User.last.id}")

    expect(page).to have_content("JohnDoe")
    expect(page).to have_content("email@email.com")
    expect(page).to_not have_content("Password123")
    #somehow test for imageurl in css?
    expect(page).to have_content("I'm a user and I'm here to get a job")
    expect(page).to have_content("I'm a real go-getter")
    expect(page).to have_content("Denver")
    expect(page).to have_content("Colorado")

    expect(User.count).to eq(1)
  end
end
