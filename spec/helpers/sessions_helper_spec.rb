require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the SessionsHelper. For example:
#
# describe SessionsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
describe SessionsHelper do

  describe "Guest User" do

    let(:guest_user) do
      @user = User.new_guest
      @user.save
      sign_in @user
    end

    context "It creates a user as a guest by default" do
      it "should have guest equal to true" do
        expect(guest_user.guest).to be_truthy
      end

      it "should be the current user" do
        expect(guest_user).to be(current_user)
      end
    end
  end
end
