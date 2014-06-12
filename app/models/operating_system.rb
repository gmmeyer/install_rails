class OperatingSystem < ActiveRecord::Base
  
  has_many :steps
  has_many :step_contents, through: :steps

  validates :brand, :version, presence: true
end
