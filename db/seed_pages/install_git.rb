html = <<-HTML
  <h1>Install Git</h1>
  <ol>
    <li>
      In your terminal type
    </li>
    <pre><code>brew install git </code></pre>
    <li>
      To verify your installation, in your terminal type
    </li>
      <pre><code>git --version</code></pre>
      <p>Approximate expected result</p>
      <pre><code>git version 1.8.x.x</code></pre>
  </ol>
HTML

step_content = StepContent.create(title: "Install Git", content: html)

previous_steps = Step.joins(:operating_system).joins(:step_content).where("step_contents.title = 'Install Homebrew'")

previous_steps.each do |step|
  Step.create(operating_system_id: step.operating_system_id, step_content_id: step_content.id, previous_step_id: step.id)
end