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

previous_steps = Step.joins(:operating_system).joins(:step_content).where("(operating_systems.version = '10.8' OR operating_systems.version = '10.7' OR operating_systems.version = '10.6') AND step_contents.title = 'Find The Command Line'")

previous_steps.each do |step|
  Step.create(step_content_id: step_content.id, previous_step_id: step.id, operating_system_id: step.operating_system_id, prompt: "What version of Ruby do you have?")
end