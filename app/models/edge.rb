class Edge < ActiveRecord::Base

  belongs_to :previous_step, class_name: "Step", primary_key: :id, foreign_key: :previous_step_id
  belongs_to :next_step, class_name: "Step", primary_key: :id, foreign_key: :previous_step_id

  validates :previous_step_id, :next_step_id, presence: true
  validate :check_link

  def options
    {"os" => self.os, 
      "os_version" => self.os_version,
      "rails_version" => self.rails_version,
      "ruby_version" => self.ruby_version
    }
  end

  def follow?(user = nil)
    if self.single_edge
      return true
    elsif user
      if self.os && user.os == self.os && user.os_version == self.os_version
        return true
      elsif self.rails_version && user.rails_version == self.rails_version
        return true
      elsif self.ruby_version && user.ruby_version == self.ruby_version
        return true
      end
    end

    false
  end

  def single?
    self.single_edge
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
  def check_link
    unless self.single_edge || self.os || self.os_version || self.rails_version || self.ruby_version || self.button_text
      errors.add(:single_edge, "You must provide some way of letting the user know where to go next")
    end
  end
end
