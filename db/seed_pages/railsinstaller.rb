def rails_installer
  <<-"HTML"
      <h1>Time to install Rails!</h1>
      <ol>
        <li>
          Visit the site <a href="http://www.railsinstaller.com" target="_blank">Railsinstaller.com"</a> and choose from ONE of the following options to download RailsInstaller.<br><br>


          <small>Note: Please choose your version from the right</small>.

          <div class="center">
          <a href="http://www.railsinstaller.com" alt="RailsInstaller" target="_blank">
            #{image_tag "railsinstaller-mac-windows.jpg", alt: "RailsInstaller"}
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
          #{image_tag "mac_steps/installer_wizard.png", alt: "RailsInstaller Wizard"}
        </li>
        <li>
          Click '<strong>Next</strong>' for each step - it's okay to accept the default settings.
          #{image_tag "mac_steps/rails_one_click.png"}
        </li>
        <li>
          When prompted, enter your <strong>name</strong> and <strong>email address</strong><br><small>(don't worry, no one will see this email or spam you, this is purely for setup purposes).</small>
        </li>


      </ol>
  HTML
end

def rails_installer_windows
  <<-"HTML"
      <h1>Time to install Rails!</h1>
      <ol>
        <li>
          Visit the site <a href="http://www.railsinstaller.com" target="_blank">Railsinstaller.com"</a> and choose from ONE of the following options to download RailsInstaller.<br><br>


          <small>Note: Please download from "Want to live on the edge?" download near the bottom.</small>.

          <div class="center">
          <a href="http://www.railsinstaller.com" alt="RailsInstaller" target="_blank">
            #{image_tag "railsinstaller-mac-windows.jpg", alt: "RailsInstaller"}
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
          #{image_tag "mac_steps/installer_wizard.png", alt: "RailsInstaller Wizard"}
        </li>
        <li>
          Click '<strong>Next</strong>' for each step - it's okay to accept the default settings.
          #{image_tag "mac_steps/rails_one_click.png"}
        </li>
        <li>
          When prompted, enter your <strong>name</strong> and <strong>email address</strong><br><small>(don't worry, no one will see this email or spam you, this is purely for setup purposes).</small>
        </li>


      </ol>
  HTML
end