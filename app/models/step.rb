class Step < ActiveRecord::Base
  has_many :step_orders

  # Need to sanitize input.
  # In controller, we need a method to see how to arrange next steps.
end
