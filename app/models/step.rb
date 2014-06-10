class Step < ActiveRecord::Base

  belongs_to :step_content
  belongs_to :operating_system

  belongs_to :previous_step, class_name: "Step"
  has_many :next_steps, class_name: "Step"

  def what_choice(user_choice)

    next_steps.each do |next_step|

      if next_step.user_choice
        return next_step
      end

    end

  end

  def this_step?(user_choice)
    # This way you can just define whatever comparator you want.
    user_choice.send(self.choice)
  end

end
