class OperatingSystem < ActiveRecord::Base
  has_many :install_steps
  has_many :steps, through: :install_steps
end
