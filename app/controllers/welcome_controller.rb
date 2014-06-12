class WelcomeController < ApplicationController
  def index
    @first_step = Step.find_by(first_step: true)
  end

  def test
    render layout: "application"
  end
end
