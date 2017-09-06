require 'rails_helper'

describe "User edits an existing company" do
  scenario "a user can edit a company" do
    user = User.create!(username: "User_1", email: 'sam1@sam.com', password: 'sam123', avatar_url: 'foo.png', about: "This is a sample about me snippet.", cover_letter: "This is a long letter.")

    visit edit_user_path(user)

    fill_in "user[username]", with: "User_Elite"
    click_button "Update"

    expect(current_path).to eq("/users/#{User.last.id}")
    expect(page).to have_content("User_Elite")
    expect(page).to_not have_content("User_1")
  end
end
