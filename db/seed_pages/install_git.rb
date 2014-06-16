def install_git
  <<-HTML
    <h1>Install Git</h1>
    <ol>
      <li>
        In your terminal type
      </li>
      <pre><code>brew install git </code></pre>
      <li>
        To verify your installation, in your terminal type
      </li>
        <pre><code>git --version</code></pre>
        <p>Approximate expected result</p>
        <pre><code>git version 1.8.x.x</code></pre>
    </ol>
  HTML
end