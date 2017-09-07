require 'rails_helper'

RSpec.feature "When a user visits the categories page" do
  context "as an admin" do
    scenario "they can see a list of all categories" do
      admin = User.create(username: "Admin", password: "boom", role: "admin")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_categories_path
      expect(page).to have_content('Admin Categories')
    end
  end

  context "as a user (an actual logged in user)" do
    scenario "they can not see a list of all categories" do
      default = User.create(username: "Admin", password: "boom")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(default)

      visit admin_categories_path
      expect(page).to_not have_content("Admin Categories")
    end
  end
end
