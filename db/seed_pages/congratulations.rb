def congrats
  <<-"HTML"

  <section class="instructions">
    <h1>
      Congratulations!
    </h1>
      #{image_tag "mac_steps/congrats_sam.png", class: "congrats_sam", style: "display:inline;"}
    <h2>What's next?</h2>
    <ol>
      <li>
        #{image_tag "omr_logo.png", style: "display:inline; padding: 0;"} <strong><a href="http://onemonthrails.com/?utm_source=installrails" target="_blank">One Month Rails</a></strong> helps you build your first app in less than one month!
      </li>
      <li><strong><a href="http://onemonthrails.com/?utm_source=installrails" target="_blank">Enroll Now</a></strong> and get started learning Rails.
      </li>
    </ol>

    <strong><h3>Other Resources We Love for Learning Ruby and Rails:</h3></strong>



      <div class="row">
        <div class="col-sm-6">
           <ul>
            <li>
              <a href="http://ruby.railstutorial.org/ruby-on-rails-tutorial-book" target="_blank">Ruby on Rails Tutorial by Michael Hartl</a>
            </li>
            <li>
              <a href="http://railscasts.com/" target="_blank">RailsCasts by Ryan Bates</a>
            </li>
            <li>
              <a href="http://guides.rubyonrails.org/" target="_blank">Ruby on Rails Guides</a>
            </li>
          </ul>
        </div>


        <div class="col-sm-6">
          <ul>
            <li>
              <a href="http://generalassemb.ly/" target="_blank">General Assembly (12 week offline)</a>
            </li>
            <li>
              <a href="http://codecademy.com" target="_blank">Codecademy</a>
            </li>
            <li>
              <a href="http://codeschool.com" target="_blank">Codeschool</a>
            </li>
            <li>
              <a href="http://teamtreehouse.com/" target="_blank">Treehouse</a>
            </li>
          </ul>
        </div>
      </div>

  HTML
end