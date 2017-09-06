require 'rails_helper'

describe User do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a username" do
        user = User.new(email: 'sam@sam.com', password: 'sam123', avatar_url: 'foo.png',
          about: "This is a sample about me snippet.", cover_letter: "This is a long letter.")

        expect(user).to be_invalid
      end

      it "is invalid without an email" do
        user = User.new(username: 'sam', password: 'sam123', avatar_url: 'foo.png',
          about: "This is a sample about me snippet.", cover_letter: "This is a long letter.")

        expect(user).to be_invalid
      end

      it "is invalid without a password" do
        user = User.new(username: 'sam', email: 'sam@sam.com', avatar_url: 'foo.png',
          about: "This is a sample about me snippet.", cover_letter: "This is a long letter.")

        expect(user).to be_invalid
      end

      it "is invalid without an avatar_url" do
        user = User.new(username: 'sam', email: 'sam@sam.com', password: 'sam123',
          about: "This is a sample about me snippet.", cover_letter: "This is a long letter.")

        expect(user).to be_invalid
      end

      it "is invalid without an about attribute" do
        user = User.new(email: 'sam@sam.com', password: 'sam123', avatar_url: 'foo.png',
          cover_letter: "This is a long letter.")

        expect(user).to be_invalid
      end

      it "is invalid without a username" do
        user = User.new(email: 'sam@sam.com', password: 'sam123', avatar_url: 'foo.png',
          about: "This is a sample about me snippet.")

        expect(user).to be_invalid
      end

      it "has a unique username" do
        create(:user, username: "Taken")
        user = User.new(name: "Taken")

        expect(user).to be_invalid
      end

      it "has a unique email" do
        create(:user, email: "taken@taken.com")
        user = User.new(email: "taken@taken.com")

        expect(user).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a name, email, and password" do
        user = create(:user)
        expect(user).to be_valid
      end
    end
  end
end
