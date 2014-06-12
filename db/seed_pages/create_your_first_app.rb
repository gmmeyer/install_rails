html = <<-HTML
  <h1>Create your first app</h1>
      <p>If you followed all the previous steps correctly, you should be ready to create your first app.</p>
    <ol>
    <li>
      Run the <strong>cd</strong> <i>(change directory)</i> command in Terminal to change directory into your desktop folder
      <pre><code>$ cd ~/Desktop</code></pre>
    </li>

    <div class="row">

      <div class="col-sm-6 note">
        NOTE:
        We do this so that when we create a new application, we'll be able to see it in our desktop and access it more easily.
      </div>
      <div class="col-sm-6">
          <img src="sam.png">
       </div>
    </div>


    <li>
      You can doublecheck that you did this correctly with the command <strong>pwd</strong> <i>(print working directory)</i>, which will tell you what folder you're currently in.
      <pre><code>$ pwd</code></pre>
    </li>
    <li>
      Expected result:
      <pre><code>/Users/<strong>[YOUR USER NAME]</strong>/Desktop</code></pre>
    </li>
    <li>
      Now we're going to run a command that will create a new rails application
      <pre><code>$ rails new sample_app</code></pre>
    </li>
    <li>
      We just created a new app! Let's see it live.
    </li>
  </ol>
HTML

windows_html = <<-HTML
  <h1>Create your first app</h1>
      <p>If you followed all the previous steps correctly, you should be ready to create your first app.</p>
    <ol>
    <li>
      Run the <strong>cd</strong> <i>(change directory)</i> command in Terminal to change directory into your desktop folder
      <pre><code>$ cd ~/Desktop</code></pre>
    </li>

    <div class="row">

      <div class="col-sm-6 note">
        NOTE:
        We do this so that when we create a new application, we'll be able to see it in our desktop and access it more easily.
      </div>
      <div class="col-sm-6">
          <img src="sam.png">
       </div>
    </div>


    <li>
      You can doublecheck that you did this correctly with the command <strong>pwd</strong> <i>(print working directory)</i>, which will tell you what folder you're currently in.
      <pre><code>$ pwd</code></pre>
    </li>
    <li>
      Expected result:
      <pre><code>/Users/<strong>[YOUR USER NAME]</strong>/Desktop</code></pre>
    </li>
    <li>
      Now we're going to run a command that will create a new rails application
      <pre><code>$ rails new sample_app</code></pre>
    </li>
    <li>
      We just created a new app! Let's see it live.
    </li>
  </ol>
HTML

trouble = <<-HTML
  <h4>#1 - My error is about "Uglifier"</h4>
  <p>If your error resembles something like...</p>
  <pre><code>#ERROR MESSAGE:
  Could not find gem 'uglifier <>=1.0.3> x85-mingw32' in the gems available on this machine
  Run 'bundle install' to install missing gems</code></pre>
   <p>Try running...</p>
  <pre><code>$ gem install uglifier</code></pre>
  <hr>

   <h4>#2 - My error is about "sdoc"</h4>
  <p>If your error resembles something like...</p>
  <pre><code>#ERROR MESSAGE:
  Could not find gem 'sdoc (>= 0) ruby' in the gems available on this machine
  Run 'bundle install' to install missing gems.</code></pre>
   <p>Try running...</p>
  <pre><code>$ gem install sdoc</code></pre>

  <hr><br>
HTML

step_content = StepContent.create(title: "Create Your First App", content: html, trouble: trouble)

previous_steps = Step.joins(:operating_system).joins(:step_content).where("(operating_systems.brand = 'Mac' AND step_contents.title = 'Sublime Text') OR step_contents.title = 'TextMate'")

previous_steps.each do |step|
  Step.create(operating_system_id: step.operating_system_id, step_content_id: step_content.id, previous_step_id: step.id)
end

step_content = StepContent.create(title: "Create Your First App In Windows", content: windows_html, trouble: trouble)

previous_step = Step.joins(:operating_system).joins(:step_content).where("operating_systems.brand = 'Windows' AND step_contents.title = 'Sublime Text'")[0]

Step.create(operating_system_id: previous_step.operating_system_id, step_content_id: step_content.id, previous_step_id: previous_step.id)