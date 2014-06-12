html = <<-HTML

  <h1>
    Good! Now let's make sure you have the latest version of Rails
  </h1>
  <ol>
    <li>
      Next, check to see if you have Rails installed by running:
       <pre><code>$ rails --version</code></pre>
    </li>
  </ol>

HTML

step_content = StepContent.create(title: "Verify Rails Version", content: html)

previous_steps = StepContent.find_by(title: "Verify Ruby Version").steps

previous_steps.each do |step|
  Step.create(button_text: 2.0, operating_system_id: step.operating_system_id, step_content_id: step_content.id, previous_step_id: step.id)
end

previous_steps = StepContent.find_by(title: "Update Ruby").steps

previous_steps.each do |step|
  Step.create(operating_system_id: step.operating_system_id, step_content_id: step_content.id, previous_step_id: step.id)
end