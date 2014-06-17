def choose_os_version
  <<-"HTML"
      <h1>What version of Mac OS do you have?</h1>
      <ol>
        <li>Click on the &#63743; <strong>Apple</strong> logo (at the top left of your screen)<br>and select '<strong>About This Mac</strong>'

          #{ image_tag("mac_steps/select_about_this_mac.png") }
          #{ image_url("mac_steps/select_about_this_mac.png")}

         <small>Your version number is shown under <strong>OS X</strong></small>
            #{image_tag("mac_steps/about_this_mac.png")}
        </li>

      </ol>
  HTML
end