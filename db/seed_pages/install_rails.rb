def install_rails
  <<-HTML
    <h1>Install Rails</h1>
    <ol>
      <li>
        In your terminal type
      </li>
      <pre><code>gem install rails --no-ri --no-rdoc</code></pre>
      <li>
        To verify your installation, in your terminal type
      </li>
        <pre><code>rails --version</code></pre>
        <p>Approximate expected result</p>
        <pre><code>Rails 4.0.x</code></pre>
    </ol>
    <div class="row">
        <div class="col-sm-12 note">
          <h3>Notes:</h3>
          <ul>
            <li>This will install Rails and may take a while.</li>
            <li>If Rails cannot install, try running the code below and then restarting your computer:
              <pre><code>brew install apple-gcc42</code></pre>

              <p>If you are still stuck, try:
                <pre><code>sudo xcodebuild -license
  sudo port upgrade outdated
  rvm reinstall 2.0.0</pre></code>
              </p>
            </li>
          </ul>
        </div>
      </div>
  HTML
end