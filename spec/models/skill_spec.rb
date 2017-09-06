require 'rails_helper'

describe Skill do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        user = User.create!(username: 'test', email: 'sam@sam.com', password: 'sam123', avatar_url: 'foo.png', about: "This is a sample about me snippet.", cover_letter: "This is a long letter.")
        skill = user.skills.new(level: 5)
        expect(skill).to be_invalid
      end

      it "is invalid without a name" do
        user = User.create!(username: 'test', email: 'sam@sam.com', password: 'sam123', avatar_url: 'foo.png', about: "This is a sample about me snippet.", cover_letter: "This is a long letter.")
        skill = user.skills.new(name: "JavaScript")
        expect(skill).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with all skill attributes" do
        user = User.create!(username: 'test', email: 'sam@sam.com', password: 'sam123', avatar_url: 'foo.png', about: "This is a sample about me snippet.", cover_letter: "This is a long letter.")
        skill = user.skills.create!(name: "JavaScript", level: 5)
        expect(skill).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a user" do
      user = User.create!(username: 'test', email: 'sam@sam.com', password: 'sam123', avatar_url: 'foo.png', about: "This is a sample about me snippet.", cover_letter: "This is a long letter.")
      skill = user.skills.create!(name: "JavaScript", level: 5)
      expect(skill).to respond_to(:user)
    end
  end
end
