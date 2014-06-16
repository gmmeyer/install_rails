def verify_rails_version
  <<-HTML

    <h1>
      Good! Now let's make sure you have the latest version of Rails
    </h1>
    <ol>
      <li>
        Next, check to see if you have Rails installed by running:
         <pre><code>$ rails --version</code></pre>
      </li>
    </ol>

  HTML
end