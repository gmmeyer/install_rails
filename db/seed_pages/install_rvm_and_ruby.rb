def install_rvm_and_ruby
  <<-HTML
    <h1>Install RVM and Ruby</h1>
    <p class="center">RVM is short for <strong>Ruby Version Manager</strong>. RVM makes it easy to install different versions of Ruby on your computer and manage them as well</p>
    <hr>
    <ol>
      <li>To install RVM, type this in your terminal</li>
      <pre><code>\curl -L https://get.rvm.io | bash -s stable</code></pre>

      <li>Close your terminal and then re-open it. Now, lets see if RVM was loaded properly:
        <pre><code>type rvm | head -n 1</code></pre>
      </li>
      <li>Now install Ruby with:
        <pre><code>rvm use ruby --install --default
  ruby -v</code></pre>
        <p>This will install Ruby and may take a while, on older OSX it might take up to 1 hour.</p>
      </li>

    </ol>
  HTML
end