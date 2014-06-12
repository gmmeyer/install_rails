html = <<-HTML
  <h1>Because you don't have the latest version of Ruby, we're going to update</h1>
  <ol>
    <li>In the command line, run the following command to update to the latest stable of RVM (Ruby Version Manager):
      <pre><code>rvm get stable</code></pre>
    </li>

    <li>Then run the following command to install Ruby 2.0.0 using RVM:
      <pre><code>rvm install 2.0.0 \
      --with-openssl-dir=$HOME/.rvm/usr \
      --verify-downloads 1</code></pre>
    </li>
    <p>This command may take a few minutes</p>

    <li>
      Set this new version to default with:
      <pre><code>rvm use --default 2.0.0</code></pre>
    </li>

    <li>
      Now check what version of Ruby your system is currently using:
      <pre><code>ruby --version</code></pre>
    </li>
  </ol>
HTML

step_content = StepContent.create(title: "Update Ruby", content: html)

previous_steps = StepContent.find_by(title: "Verify Ruby Version").steps

previous_steps.each do |step|
  Step.create(button_text: 1.9, operating_system_id: step.operating_system_id, step_content_id: step_content.id, previous_step_id: step.id)
  Step.create(button_text: 1.8, operating_system_id: step.operating_system_id, step_content_id: step_content.id, previous_step_id: step.id)
end
