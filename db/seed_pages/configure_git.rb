html = <<-HTML
<h1>Configure Git</h1>
<ol>
  <li>
    In your Terminal type:
    <pre><code>git config --global user.name "<strong>Your Actual Name</strong>"</code></pre>
  </li>
  <li>
    And then type:
    <pre><code>git config --global user.email "<strong>Your Actual Email</strong>"</code></pre>
    <div class="row">
      <div class="col-sm-12 note" id="prompt" style="text-align:center;">
        Your email address should be the same one associated with your <a href="http://help.github.com/articles/set-up-git" target="_blank">GitHub</a> account.
      </div>
    </div>
  </li>
  <li>
    To verify your configuration, type:
    <pre><code>git config -l</code></pre>
  </li>
    <p style="text-align: center; color: rgb(154, 155, 160);">Your email and user name should appear in return</p>
  </li>
  </ol>
  <hr>

  <div class="center" id="git-intro">
    <h2>Why did we do this? What is Git?</h2>
    <p>
      Git is version control software. You will use Git to track and manage your coding history as well as get into the programming community as a whole.
    </p>
    <p>
      To put it another way, Git will allow you to make revisions of your work as well as others... this way you can feel assured that if you make an awful mistake to fix or have a solution for someone else, Git will be the best way to do it!
    </p>

    <div class="row">
      <p>More information and resources on Git here: <a href="http://git-scm.com/videos">Here</a></p>
    </div>
HTML

step_content = StepContent.create(title: "Configure Git", content: html)

previous_steps = Step.joins(:operating_system).joins(:step_content).where("((operating_systems.version = '10.8' OR operating_systems.version = '10.7' OR operating_systems.version = '10.6') AND step_contents.title = 'Install Rails') OR step_contents.title = 'Update Rails' OR step_contents.title = 'Install Git' ")

previous_steps.each do |step|
  Step.create(operating_system_id: step.operating_system_id, step_content_id: step_content.id, previous_step_id: step.id)
end

previous_steps = Step.joins(:operating_system).joins(:step_content).where("step_contents.title = 'Verify Rails Version'")

previous_steps.each do |step|
  Step.create(operating_system_id: step.operating_system_id, step_content_id: step_content.id, previous_step_id: step.id, button_text: '4.0')
end