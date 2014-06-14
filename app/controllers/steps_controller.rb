class StepsController < ApplicationController

  before_filter :signed_in_user, only: [:show]

  def new
    @step = Step.new
    unauthorized! if cannot? :manage, @step
  end

  def show
    @step = Step.find_by(permalink: params[:id])
  end

  def edit
    @step = Step.find_by(permalink: params[:id])
    unauthorized! if cannot? :manage, @step
  end

  def create
    @step = Step.new(step_params)
    unauthorized! if cannot? :manage, @step
    if @step.save
      redirect_to #admin thing
    else
      flash[:errors] = @step.errors.full_messages
    end
  end

  def update
    @step = Step.find_by(permalink: params[:id])
    unauthorized! if cannot? :manage, @step
    if @step.save
      redirect_to #admin page
    else
      flash[:errors] = @step.errors.full_messages
      redirect_to #admin page
    end
  end

  def delete
    @step = Step.find(permalink: params[:id])
    @step.destroy
    redirect_to #admin page
  end

  private
  def step_params
    params.require(:step).permit(:title, :content, :trouble, :mixpanel, :final_step, :first_step, :prompt, :permalink)
  end
end
