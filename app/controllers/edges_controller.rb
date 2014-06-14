class EdgesController < ApplicationController

  def create
    @edge = Edge.new(edge_params)
    unauthorized! if cannot? :edit, @edge
    if @edge.save
      redirect_to #admin_step_url
    else
      flash[:errors] = @edge.errors.full_messages
      redirect_to #admin_step_url
    end
  end

  def update

  end

  def delete
    @edge = Edge.find_by(params[:id])
    unauthorized! if cannot? :edit, @edge
    @edge.destroy
    redirect_to #admin_step_url
  end

  private
  def edge_params
    params.require(:edge).perrmit(:previous_step_id, 
      :next_step_id, :choice, :button_text, :os, :os_version, 
      :rails_version, :ruby_version, :single_edge
      )
  end

end
