class StepsController < ApplicationController

  before_filter :signed_in_user, only: [:show]

  def index
    @steps = Steps.all

    render :index
  end

  def new
    @step = Step.new
    unauthorized! if cannot? :manage, @step

    render :new
  end

  def show
    @step = Step.includes([:previous_steps, :next_edges, :previous_edges]).includes(next_edges: :next_step).find_by(permalink: params[:id])

    @next_edges = @step.get_next_edges(current_user)
    @next_steps = @step.get_next_steps(current_user)
    @previous_step = @step.get_previous_step(current_user)

    if @step.first_step?
      @mac = @step.next_edges.includes(:next_step).find_by(button_text: "Mac")
      @windows = @step.next_edges.includes(:next_step).find_by(button_text: "Windows")
      @other = @step.next_edges.includes(:next_step).find_by(button_text: "Other")
    end

    render :show
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
