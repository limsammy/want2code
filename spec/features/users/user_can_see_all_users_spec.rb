require 'rails_helper'

describe "User creates a new user profile" do
  scenario "a user can create a new user profile" do

    User.create!(username: "User_1", email: 'sam1@sam.com', password: 'sam123', avatar_url: 'foo.png', about: "This is a sample about me snippet.", cover_letter: "This is a long letter.")
    User.create!(username: "User_2", email: 'sam2@sam.com', password: 'sam123', avatar_url: 'foo.png', about: "This is a sample about me snippet.", cover_letter: "This is a long letter.")
    User.create!(username: "User_3", email: 'sam3@sam.com', password: 'sam123', avatar_url: 'foo.png', about: "This is a sample about me snippet.", cover_letter: "This is a long letter.")
    User.create!(username: "User_4", email: 'sam4@sam.com', password: 'sam123', avatar_url: 'foo.png', about: "This is a sample about me snippet.", cover_letter: "This is a long letter.")
    User.create!(username: "User_5", email: 'sam5@sam.com', password: 'sam123', avatar_url: 'foo.png', about: "This is a sample about me snippet.", cover_letter: "This is a long letter.")

    visit '/users'

    save_and_open_page
    expect(page).to have_content("User_1")
    expect(page).to have_content("User_2")
    expect(page).to have_content("User_3")
    expect(page).to have_content("User_4")
    expect(page).to have_content("User_5")

    expect(User.count).to eq(5)
  end
end
