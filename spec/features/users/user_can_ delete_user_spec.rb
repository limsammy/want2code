require 'rails_helper'

describe "User deletes user" do
  scenario "a user can delete a user" do
    user_1 = User.create!(username: "User_1", email: 'sam1@sam.com', password: 'sam123', avatar_url: 'foo.png', about: "This is a sample about me snippet.", cover_letter: "This is a long letter.")
    user_2 = User.create!(username: "User_2", email: 'sam2@sam.com', password: 'sam123', avatar_url: 'foo.png', about: "This is a sample about me snippet.", cover_letter: "This is a long letter.")

    visit users_path
    # save_and_open_page
    # binding.pry

    expect(page).to have_content("User_1")
    expect(page).to have_content("User_2")

    visit "/users/#{user_1.id}"

    click_on "Delete User"

    expect(current_path).to eq("/users")
    expect(page).to have_content("User has been deleted")
    expect(page).to_not have_content("User_1")
    expect(page).to have_content("User_2")
  end
end
