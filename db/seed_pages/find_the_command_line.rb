html = <<-HTML
    <div class="center">
      <small>
        Now we're going to explore something called:
      </small>
      <h1>
        The Command Line
      </h1>
    </div>

     <p>
       The command line is a place on your computer where you can type in executable code <i>(You will see in a moment)</i>
     </p>

     <p>After you type them in, you'll hit <strong>Enter</strong> to run the commands</p>
     <p style="text-align: center; color: rgb(154, 155, 160);">This is where magic happens</p>
     <hr>
      <ol>
        <li>
          On a Mac, we can find the Terminal by opening Spotlight and type '<strong>Terminal</strong>' <i><br>(the little <i class="icon-search"></i> icon on the top right corner of your Mac)</i><br>
          <img src="mac_steps/spotlight_search_for_terminal.png">
        </li>
        <li>
          Alternatively, you could look in your '<strong>Applications</strong>' folder
          <br>It's under '<strong>Applications -> Utilities -> Terminal</strong>'
          <img src="mac_steps/applications_utilities_terminal.png">
        </li>
        <li>
          Once you open it, your Terminal should look something like this <i>(don't freak out)</i>:
          <img src="mac_steps/teminal.png">
        </li>

          <div class="row">
              <div class="col-sm-6 note" style="text-align: center;">
              PRO TIP:
              Add Terminal to your dock; you'll be using it a lot.
              Click &amp; Hold the Terminal dock icon and select
              '<strong>Options > Keep in Dock</strong>'
              </div>
              <div class="col-sm-6">
                <img src="sam.png">
              </div>
          </div>


          <li>
            Now try typing the following command and hitting '<strong>Enter</strong>'
            <pre><code>$ jot - 1 25</code></pre>
            <div class="row">
              <div class="col-sm-6 note" id="prompt" style="text-align: center;">
                Ignore the <strong>$</strong> and the <strong>space</strong> at the beginning. It is called a <strong>prompt</strong> and it just means the command is executable
              </div>
            </div>
          </li>
          It should print out list of all the numbers from <strong>1</strong> to <strong>25</strong>
          <pre style="margin-top: 1.4em"><code>
            $ jot - 1 25
            1
            2
            .
            .
            .
            24
            25
          </code></pre>
          <p style="text-align: center; color: rgb(154, 155, 160);">Try going up to a million. ~__^</p>
        </ol>
HTML

step_content = StepContent.create(title: "Find The Command Line", content: html)

previous_steps = Step.joins(:step_content).where("step_contents.title = 'Install XCode' OR step_contents.title = 'RailsInstaller'")

previous_steps.each do |step|

  Step.create(step_content_id: step_content.id, previous_step_id: step.id, operating_system_id: step.operating_system_id)

end