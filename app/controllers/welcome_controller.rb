class WelcomeController < ApplicationController
  def index
    sign_in(User.new_guest)
    @first_step = Step.find_by(first_step: true)
  end

  def test
    render layout: "application"
  end

  def admin
    render :admin
  end

  def images
    authorize! :manage, @step
    render :images
  end
end
