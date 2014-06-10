class StepContent < ActiveRecord::Base
  has_many :steps
  before_validation :set_friendly_name

  def to_param
    # we wanna keep the urls friendly and usable, not just random ints
    [id, step_name.parameterize].join("-")
  end

  # Need to sanitize input.
  # In controller, we need a method to see how to arrange next steps.
  # this gem: https://github.com/rgrove/sanitize seems pretty up to the task

  private
  def set_friendly_name
    @step_name = title.parameterize
  end
end
