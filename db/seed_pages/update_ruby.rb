def update_ruby
  <<-HTML
    <h1>Because you don't have the latest version of Ruby, we're going to update</h1>
    <ol>
      <li>In the command line, run the following command to update to the latest stable of RVM (Ruby Version Manager):
        <pre><code>rvm get stable</code></pre>
      </li>

      <li>Then run the following command to install Ruby 2.0.0 using RVM:
        <pre><code>rvm install 2.0.0 \
        --with-openssl-dir=$HOME/.rvm/usr \
        --verify-downloads 1</code></pre>
      </li>
      <p>This command may take a few minutes</p>

      <li>
        Set this new version to default with:
        <pre><code>rvm use --default 2.0.0</code></pre>
      </li>

      <li>
        Now check what version of Ruby your system is currently using:
        <pre><code>ruby --version</code></pre>
      </li>
    </ol>
  HTML
end