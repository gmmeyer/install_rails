class Edge < ActiveRecord::Base

  belongs_to :previous_step, class_name: "Step", primary_key: :id, foreign_key: :previous_step_id
  belongs_to :next_step, class_name: "Step", primary_key: :id, foreign_key: :next_step_id

  validates :previous_step_id, :next_step_id, presence: true
  validate :check_link

  def options
    {"os" => self.os, 
      "os_version" => self.os_version,
      "rails_version" => self.rails_version,
      "ruby_version" => self.ruby_version
    }
  end

  # button text is not included here because, if there is button text and nothing else, the button text already links it to a specific next step.
  def follow?(user = nil)
    if self.single_edge
      return true
    elsif user
      if self.os_version && user.os_version == self.os_version
        return true
      elsif self.os && user.os == self.os
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

  private
  def check_link
    unless self.single_edge || self.os || self.os_version || self.rails_version || self.ruby_version || self.button_text
      errors.add(:single_edge, "You must provide some way of letting the user know where to go next")
    end
  end
end
