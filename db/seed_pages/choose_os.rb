html = <<-HTML
    <h1>
      First off, we need to figure out which instructions to give you.
    </h1>
    <h2 style="text-align: center;">
      Which operating system are you using?
    </h2>
HTML

step_content = StepContent.create(title: "Choose OS", content: html)

Step.create(first_step: true, step_content_id: step_content.id, operating_system_id: 'NA', prompt: "NA", mixpanel: "choose_your_os")