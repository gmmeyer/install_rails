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
    unless self.single_edge || self.os || self.os_version || self.rails_version || self.ruby_version
      errors.add(:single_edge, "You must provide some way of letting the user know where to go next")
    end

    if self.button_text && !(self.single_edge || self.os || self.os_version || self.rails_version || self.ruby_version)
      errors.add(:button_text, "you cannot have button text without some way of ensuring that the previous step function works")
    end
  end
end
