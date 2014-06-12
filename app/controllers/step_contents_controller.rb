class StepContentsController < ApplicationController
  def index
    @step_contents = StepContent.all
  end

  def new
    @step_content = StepContent.new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end
