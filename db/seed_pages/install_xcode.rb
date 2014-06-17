def install_xcode
  <<-"HTML"
    <h1>Install Xcode</h1>
    <ol>
      <li>
        Open the Mac App Store. This can be found in your Applications Folder.
        #{image_tag "xcode_finder.png", class: "list-image"}
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
      #{image_tag "xcode_preferences.png", class: "list-image"}
      </li>
      <li> Click the "Locations” tab and verify your version below <small>
      #{image_tag "xcode_command_line_tool.png", class: "list-image"}
      </li>
    </ol>
  HTML
end