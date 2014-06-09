class InstallStep < ActiveRecord::Base
  # This is a membership association.
  # So that one step can be given to multiple operating systems.
  belongs_to :step
  belongs_to :operating_system
end
