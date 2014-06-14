class StepsController < ApplicationController

  before_filter :signed_in_user, only: [:show]

  def new
    @step = Step.new
  end

  def show
    @step = Step.find_by(permalink: params[:id])
  end

  def edit
    @step = Step.find(params[:id])
  end

  def update

  end

  def delete
    @step = Step.find(params[:id])
    @step.destroy
  end


end
