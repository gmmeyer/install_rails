class EdgesController < ApplicationController

  def save_user_choice
    @edge = Edge.find(params[:id])

    @edge.options.each do |key,value|
      if value
        current_user.send(key + '=', value)
      end
    end

    current_user.save

    redirect_to step_url(@edge.next_step)
  end

  def index
    @step = Step.includes(next_edges: :next_step).includes(previous_edges: :previous_step).find_by(permalink: params[:step_id])
    @steps = Step.all
    @edge = Edge.new
  end

  def create
    @edge = Edge.new(edge_params)

    authorize! :edit, @edge

    if params[:association] != '' && params[:association_value] != ''
      @edge.send(params[:association] + '=', params[:association_value])
    end

    # if @edge.save
      redirect_to step_edges_url(params[:step_id])
    # else
    #   flash[:errors] = @edge.errors.full_messages
    #   redirect_to step_edges_url(params[:step_id])
    # end
  end

  def update
    authorize! :edit, @edge
  end

  def delete
    @edge = Edge.find_by(params[:id])
    authorize! :edit, @edge
    @edge.destroy
    redirect_to step_edges_url(params[:current_step])
  end

  private
  def edge_params
    params.require(:edge).permit(:previous_step_id, 
      :next_step_id, :choice, :button_text, :os, :os_version, 
      :rails_version, :ruby_version, :single_edge
      )
  end

end
