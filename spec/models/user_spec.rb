require 'spec_helper'

describe User do

  describe "Guest User" do

    context "the new_guest method should create a user" do

      let(:user) do
        User.new_guest
      end

      it "and it should be valid" do
        expect(user).to be_valid
      end

      it "and it should be a guest" do
        expect(user.guest).to be_truthy
      end

    end
  end

  describe "Password Validations" do
    context "on a new user" do
      it "should not be valid without a password" do
        user = User.new username: 'testing',
          password: nil, password_confirmation: nil
        user.should_not be_valid
      end

      it "should be not be valid with a short password" do
        user = User.new username: 'testing',
          password: 'short', password_confirmation: 'short'
        user.should_not be_valid
      end

      it "should not be valid with a confirmation mismatch" do
        user = User.new username: 'testing',
          password: 'short', password_confirmation: 'long'
        user.should_not be_valid
      end
    end

    context "on an existing user" do
      let(:user) do
        u = User.create username: 'testing',
          password: 'password', password_confirmation: 'password'
        User.find u.id
      end

      it "should be valid with no changes" do
        user.should be_valid
      end

      it "should be valid with a new (valid) password" do
        user.password = user.password_confirmation = "new password"
        user.should be_valid
      end
    end
  end

end
