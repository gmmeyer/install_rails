html = <<-HTML
  <h1>
    Making sure you have the latest version of Ruby
  </h1>
  <ol>
    <li>
      In the command line <i>(see the last step)</i>, try running:
      <pre><code>$ ruby --version</code></pre>
    </li>
  </ol>
HTML

step_content = StepContent.create(title: "Verify Ruby Version", content: html)

content = StepContent.find_by(title: "Verify Ruby Version")
previous_steps = content.steps.where("operating_system_id = 10.9 or operating_system_id = 10.5")

previous_steps.each do |step|
  Step.create(step_content_id: step_content.id, previous_step_id: step.id, operating_system_id: step.operating_system_id)
end