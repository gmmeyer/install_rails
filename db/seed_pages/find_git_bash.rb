html = <<-HTML
   <div class="center">
      <small>
    Now we're going to explore something called:
  </small>
   <h1>
    The Command Line
   </h1>
  </div>

  <p>The command line is a place on your computer where you can type in commands (I'll show you in a moment).</p>

  <p>After you type them in you'll hit <strong>Enter</strong> to run those commands. And then the magic happens!</p>
  <hr>

  <ol>
    <li>
      <p>Open up the <strong>Git Bash</strong> application from your RailsInstaller folder.</p>

      <p>Having trouble finding it? Look under the "Start" menu."</p>
        <img src="windows-gitbash.png">

    </li>
  </ol>
HTML

step_content = StepContent.find_by(title: 'RailsInstaller')

previous_step = Step.find_by(first_step: true)

windows = OperatingSystem.find_by(brand: "Windows")

Step.create(step_content_id: step_content.id, previous_step_id: previous_step.id, operating_system_id: windows.id, choice: "Windows")

step_content = StepContent.create(title: "Find Git Bash", content: html)

previous_step = Step.joins(:operating_system).joins(:step_content).where("operating_systems.brand = 'Windows' AND step_contents.title = 'RailsInstaller' ")[0]

Step.joins(:operating_system).joins(:step_content).where("step_contents.title = 'RailsInstaller' ")[0]

  Step.create(step_content_id: step_content.id, previous_step_id: previous_step.id, operating_system_id: previous_step.operating_system_id)