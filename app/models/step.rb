class Step < ActiveRecord::Base

  belongs_to :step_content
  belongs_to :operating_system

  belongs_to :previous_step, class_name: "Step", primary_key: :id, foreign_key: :previous_step_id
  has_many :next_steps, class_name: "Step", primary_key: :id, foreign_key: :previous_step_id

  validates :operating_system_id, :step_content_id, presence: true
  validate :check_previous_steps
  validate :check_siblings
  validate :check_children

  def final_step?
    self.final_step
  end

def title
  step_content.title
end

  def next_step(user_choice = nil)
    if user_choice
      return what_choice(user_choice)
    else
      return next_steps[0]
    end
  end

  def what_choice(user_choice)
    next_steps.each do |next_step|
      if next_step.this_step?(user_choice)
        return next_step
      end
    end
  end

  def this_step?(user_choice)
    true if user_choice == self.choice
  end

  def set_choice(user_choice)
    self.choice = user_choice
    self.save
  end

  private
  def check_previous_steps
    if !self.previous_step_id && !self.first_step
      errors.add(:previous_step_id, "Either it needs to have previous steps or it needs to be set as the first step")
    end 
  end

  def check_children
    if self.prompt
      return
    elsif self.next_steps.count > 1
      errors.add(:prompt, "You must have a prompt so that the user can choose between multiple child steps")
    end
  end

  def check_siblings
    if self.choice
      return
    elsif self.button_text
      return
    elsif self.previous_step
      self.previous_step.next_steps.each do |step|
        if step.id != self.id
          errors.add(:choice, "You cannot have multiple siblings without having a choice or button text")
          break
        end
      end
    end
  end

end
