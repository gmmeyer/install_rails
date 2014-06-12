html = <<-HTML
    <h1>Time to install Rails!</h1>
    <ol>
      <li>
        Visit the site <a href="http://www.railsinstaller.com" target="_blank">Railsinstaller.com"</a> and choose from ONE of the following options to download RailsInstaller.<br><br>


        <small>Note: Windows users please download from "Want to live on the edge?" download near the bottom. Mac users please choose your version from the right</small>.

        <div class="center">
        <a href="http://www.railsinstaller.com" alt="RailsInstaller" target="_blank">
          <img src="railsinstaller-mac-windows.jpg" alt="RailsInstaller">
        </a>

        </div>

        <div class="row">
          <div class="col-sm-12 note">
            <i class="icon-warning-sign"></i> Looking for Ruby 2 and Rails 4 for Mac?<br>
            <i class="icon-check-sign"></i>&nbsp; We'll be upgrading in the next couple of steps. Be sure to finish the whole tutorial.
          </div>

          <div class="col-sm-12 note">
            <strong>Q:</strong> How do I fix the error /opt/rix to rvm ?<br>
            <strong>A:</strong> Restart your computer
          </div>
        </div>


      </li>
      <li>
        <small>Once the file has fully downloaded, double-click it to open the installer wizard.</small>
        <img src="mac_steps/installer_wizard.png" alt="RailsInstaller Wizard">
      </li>
      <li>
        Click '<strong>Next</strong>' for each step - it's okay to accept the default settings.
        <img src="mac_steps/rails_one_click.png" alt="">
      </li>
      <li>
        When prompted, enter your <strong>name</strong> and <strong>email address</strong><br><small>(don't worry, no one will see this email or spam you, this is purely for setup purposes).</small>
      </li>


    </ol>
HTML

step_content = StepContent.create(title: "RailsInstaller", content: html)

# previous_step = Step.find_by(first_step: true)

# windows = OperatingSystem.find_by(brand: "Windows")

# Step.create(step_content_id: step_content.id, previous_step_id: previous_step.id, operating_system_id: windows.id, button_text: 'NA')

previous_step = Step.joins(:step_content).where("step_contents.title = 'Choose OS Version'")[0]

middle_macs = OperatingSystem.where("version = '10.8' or version = '10.7' or version= '10.6'")

middle_macs.each do |mac|

  Step.create(step_content_id: step_content.id, previous_step_id: previous_step.id, operating_system_id: mac.id, button_text: mac.version)

end