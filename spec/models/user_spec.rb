require 'spec_helper'

describe User do

  describe "Guest User" do

    context "the new_guest method should create a user" do

      let(:user) do
        User.new_guest
      end

      it "should be valid" do
        user.should be_valid
      end

      it "should be a guest" do
        user.guest.should be_true
      end

    end
  end

end
