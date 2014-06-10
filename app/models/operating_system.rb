class OperatingSystem < ActiveRecord::Base
  has_many :step_orders
  has_many :steps, through: :step_order
end
