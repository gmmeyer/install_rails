class WelcomeController < ApplicationController
  def index
    sign_in(User.new_guest)
    @first_step = Step.find_by(first_step: true)
  end

  def test
    render layout: "application"
  end

  def admin
    unauthorized! if cannot? :manage, @step
    render :admin
  end
end
