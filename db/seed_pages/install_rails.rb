step_content = StepContent.find_by(title: "Install Rails")

previous_steps = Step.joins(:step_content).where("step_contents.title = 'Install RVM and Ruby' OR step_contents.title = 'Find Git Bash'")

previous_steps.each do |step|
  Step.create(operating_system_id: step.operating_system_id, step_content_id: step_content.id, previous_step_id: step.id)
end