html = <<-HTML
  <h1>Install Xcode</h1>
  <ol>
    <li>
      Open the Mac App Store. This can be found in your Applications Folder.
      <img src="xcode_finder.png" class="list-image">
    </li>
    <li>
      Search for “Xcode” and click the “Install” button
     <div class="row">
        <div class="col-sm-12 note">
         <strong>Assuming Xcode has finished installing:</strong> Now you can check the Command Line Tools.
         </div>
      </div>
    </li>

    <li>Open Xcode. In the menu bar click on "Xcode" then select "Preferences"
      <img src="xcode_preferences.png" class="list-image">
    </li>
    <li> Click the "Locations” tab and verify your version below <small>
      <img src="xcode_command_line_tool.png" class="list-image">
    </li>
  </ol>
HTML

content = StepContent.find_by(title: "Choose OS Version")
previous_step = content.steps[0]

content = StepContent.create(title: "Install XCode", content: html)



mac_9 = OperatingSystem.where(version: "10.9")[0]
mac_5 = OperatingSystem.where(version: "10.5")[0]

Step.create(step_content_id: content.id, previous_step_id: previous_step.id, operating_system_id: mac_9.id, button_text: "10.9")
Step.create(step_content_id: content.id, previous_step_id: previous_step.id, operating_system_id: mac_5.id, button_text: "10.5 or below")