html = <<-HTML
    <h1>What version of Mac OS do you have?</h1>
    <ol>
      <li>Click on the &#63743; <strong>Apple</strong> logo (at the top left of your screen)<br>and select '<strong>About This Mac</strong>'

      <img src="mac_steps/select_about_this_mac.png">

       <small>Your version number is shown under <strong>OS X</strong></small>
          <img src="mac_steps/about_this_mac.png">
      </li>

    </ol>
HTML

step_content = StepContent.create(title: "Choose OS Version", content: html)

previous_step = Step.find_by(first_step: true)

Step.create(step_content_id: step_content.id, operating_system_id: 'Mac', prompt: "NA", previous_step_id: previous_step.id, prompt: "Select your version of Mac OS X")