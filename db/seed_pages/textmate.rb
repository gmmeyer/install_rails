html = <<-HTML
  <h1>Install TextMate</h1>
  <p>
    As a developer, you’ll be using your text editor quite often. A text editor is a simple program that lets you write text (and by text we mean... code).
  </p>

  <p>
    Our preferred text editor is <b>Sublime Text 2</b> but this program isn't compatible with versions of OS X lower than 10.6, so we'll use <b>TextMate</b>. You’re free to use any text editor you’d like but note that <b>Microsoft Word WILL NOT WORK</b>.
  </p>
  <hr>
  <ol>
    <li>
      To download TextMate visit this link <a href="http://archive.textmate.org/TextMate_1.5.11_r1635.zip" target="_blank">http://archive.textmate.org/TextMate_1.5.11_r1635.zip</a>
    </li>
    <li>This will download a file that will appear in your “Downloads” folder (or wherever you save downloaded files).</li>
    <li>Double click on the newly downloaded file.</li>
    <li>A new window will open. Drag and drop TextMate into your Applications folder.</li>
  </ol>
HTML

previous_step = Step.joins(:operating_system).joins(:step_content).where("operating_systems.version = '10.5' AND step_contents.title = 'Install Rails'").first

step_content = StepContent.create(title: "TextMate", content: html)

Step.create(operating_system_id: previous_step.operating_system_id, step_content_id: step_content.id, previous_step_id: previous_step.id)