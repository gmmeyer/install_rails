def update_rails
  <<-HTML
      <h1>Because you don't have the latest version of Rails, we're going to update to the latest version</h1>
      <ol>
        <li>In the command line, run the following command:</li>
        <pre><code>$ gem update rails --no-ri --no-rdoc</code></pre>
        <p>This command should update several gems for you and may take a few minutes</p>
        <li>
          Next, check to see if you have Rails installed by running:
           <pre><code>$ rails --version</code></pre>
        </li>
      </ol>
  HTML
end