def see_it_live
  <<-"HTML"

    <h1>See it live!</h1>
    <ol>
      <li>
        Move into your new application folder
        <pre><code>$ cd ~/Desktop/sample_app</code></pre>
      </li>
      <li>
        We're going to start a little server so we can see the application in a browser
        <pre><code>$ rails server</code></pre>
      </li>
      <li>
        This command should show you:
        <pre><code>=> Booting WEBrick
  => Rails 4.0.0 application starting in development on http://0.0.0.0:3000
  => Run `rails server -h` for more startup options
  => Ctrl-C to shutdown server
  [2013-08-01 16:37:03] INFO  WEBrick 1.3.1
  [2013-08-01 16:37:03] INFO  ruby 2.0.0 (2013-05-14) [x86_64-darwin12.4.0]
  [2013-08-01 16:37:03] INFO  WEBrick::HTTPServer#start: pid=12109 port=3000</code></pre>
      </li>

          <li>
            Open up your browser and visit <a href="http://localhost:3000" target="_blank">http://localhost:3000</a>
          </li>
        </ol>
        <p>You should see your new web app!</p>
         <hr>

       <div class="row">
              <div class="col-sm-6 note">
              PRO TIP: <br>Whenever you run <pre><code>$ rails server</pre></code> ...you'll no longer be able to type anything in that command line window (because that window is now busy running your site). <br><br>Leaving us with two options: <br>1) When you're coding: let this window run the server, and open another command line window to write new commands<br>2) When you're finished: close the server by hitting '<strong>Control + C</strong>' and give yourself a pat on the back for being awesome.
            </div>
             <div class="col-sm-6">
              #{image_tag "sam.png", class: 'sam'}
            </div>

      </div>

  HTML
end