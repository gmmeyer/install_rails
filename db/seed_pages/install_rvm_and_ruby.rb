html = <<-HTML
  <h1>Install RVM and Ruby</h1>
  <p class="center">RVM is short for <strong>Ruby Version Manager</strong>. RVM makes it easy to install different versions of Ruby on your computer and manage them as well</p>
  <hr>
  <ol>
    <li>To install RVM, type this in your terminal</li>
    <pre><code>\curl -L https://get.rvm.io | bash -s stable</code></pre>

    <li>Close your terminal and then re-open it. Now, lets see if RVM was loaded properly:
      <pre><code>type rvm | head -n 1</code></pre>
    </li>
    <li>Now install Ruby with:
      <pre><code>rvm use ruby --install --default
ruby -v</code></pre>
      <p>This will install Ruby and may take a while, on older OSX it might take up to 1 hour.</p>
    </li>

  </ol>
HTML

step_content = StepContent.create(title: "Install RVM and Ruby", content: html)

previous_steps = Step.joins(:operating_system).joins(:step_content).where("(operating_systems.version = '10.9' OR operating_systems.version = '10.5') AND step_contents.title = 'Configure Git' ")

previous_steps.each do |step|
  Step.create(operating_system_id: step.operating_system_id, step_content_id: step_content.id, previous_step_id: step.id)
end