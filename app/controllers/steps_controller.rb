class StepsController < ApplicationController

  before_filter :signed_in_user, only: [:show]

  def show
    # I need to override that customization
    Step.find_by(step_name: params[:id])
  end

  def edit
  end

  def update
  end

  def delete
  end


end
