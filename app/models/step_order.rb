class StepOrder < ActiveRecord::Base

  belongs_to :step
  belongs_to :previous_step, class_name: "Step"
  has_many :next_steps, class_name: "Step"
  
end
