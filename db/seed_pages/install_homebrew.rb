html = <<-HTML
  <h1>Install Homebrew</h1>
  <ol>
    <li>
      In your terminal type
    </li>
      <pre><code>ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"</code></pre>

     <div class="row">
      <div class="col-sm-12 note">
          <b>Note:</b> If this doesn’t work, <a href="https://github.com/mxcl/homebrew/wiki/installation" "email me">go here</a> and follow the instructions
      </div>
     </div>
    <li>
      To verify your installation, enter the following in your terminal:
    </li>
      <pre><code>brew -v</code></pre>
      <p>Approximated result</p>
      <pre style="margin-bottom: 3em;"><code>Homebrew 0.9.X</code></pre>
    <li>
      To make sure Homebrew is feeling alright, type:
   </li>
   <pre style="margin-bottom: 3em"><code>brew doctor</code></pre>
   <p>If it asks you to run brew update, do so.</p>
    <div class="row">
      <div class="col-sm-12 note">
        <p>
          If it returns: <br /><span style="color: black;">“No such file or directory - /usr/local/Cellar”</span><br />You should type and enter:
        </p>
       <pre style="margin-bottom: 3em"><code>cd
sudo mkdir /usr/local/Cellar</code></pre>
        <p>Enter your login password and press enter <i>(you won't be able to see it)</i></p>
      </div>
    </div>
  </ol>
HTML

step_content = StepContent.create(title: "Install Homebrew", content: html)

previous_steps = Step.joins(:operating_system).joins(:step_content).where("(operating_systems.version = '10.9' OR operating_systems.version = '10.5') AND step_contents.title = 'Find The Command Line'")

previous_steps.each do |step|
  Step.create(operating_system_id: step.operating_system_id, step_content_id: step_content.id, previous_step_id: step.id)
end