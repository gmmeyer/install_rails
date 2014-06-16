def verify_ruby_version
  <<-HTML
    <h1>
      Making sure you have the latest version of Ruby
    </h1>
    <ol>
      <li>
        In the command line <i>(see the last step)</i>, try running:
        <pre><code>$ ruby --version</code></pre>
      </li>
    </ol>
  HTML
end