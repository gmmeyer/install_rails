html = <<-HTML

  <h1>Install Sublime Text</h1>
      <p>As a developer, you’ll be using your text editor quite often. A text editor is a simple program that lets you write text <i>(and by text we mean... code)</i>. Our preferred text editor is <strong>Sublime Text</strong>.</p>
      <hr>
  <ol>
    <li>
      <p>To download Sublime Text visit the Sublime Text site and download it to your computer (hint: click the big blue button on their homepage).</p>
       <center>
       <a href="http://sublimetext.com/" target="_blank" class="btn option">"Visit Sublime Text and Download"</a>
      </center>
    </li>
    <li>
      Once the file has fully downloaded, double-click it and a new window will open. One a Mac: drag and drop <strong>Sublime Text 2</strong> into your <strong>Applications</strong> folder.
      <img src="mac_steps/applications_folder.png" class="list-image">
    </li>
  </ol>

HTML

step_content = StepContent.create(title: "Sublime Text", content: html)

previous_steps = Step.joins(:step_content).joins(:operating_system).where("step_contents.title = 'Install Rails' AND (operating_systems.version = '10.9' OR operating_systems.brand = 'Windows')")

previous_steps += Step.joins(:step_content).joins(:operating_system).where("step_contents.title = 'Configure Git'")

previous_steps.each do |step|
  Step.create(operating_system_id: step.operating_system_id, step_content_id: step_content.id, previous_step_id: step.id)
end