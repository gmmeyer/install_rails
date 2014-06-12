class StepContent < ActiveRecord::Base

  has_many :steps, foreign_key: :step_content_id
  before_save :set_friendly_name
  before_create :set_friendly_name

  before_validation :sanitize_content
  before_validation :sanitize_trouble

  validates :title, :content, presence: true

  # I wanna do this, but I don't wanna test it yet.
  # def to_param
  #   # we wanna keep the urls friendly and usable, not just random ints
  #   [id, self.step_name].join("-")
  # end

  # Need to sanitize input.
  # In controller, we need a method to see how to arrange next steps.
  # this gem: https://github.com/rgrove/sanitize seems pretty up to the task

  # private
  def set_friendly_name
    self.step_name = title.parameterize
  end

  def sanitize_content
    if self.trouble
      self.trouble = Sanitize.clean(self.content, 
        elements: ["a", "img", "strong", "li", "ul", "ol", "pre", "code", "h1", "h2", "h3", "div", "small", "p", "i", "hr"], 
        attributes: {'a' => ["target", "href", "title", "class", :data], 
          'img' => ['alt', 'title', 'src', "class", "style"], 
          "div" => ["class"], "h2" => ["style"],
          "p" => ["style"]
          },
        protocols: { 'a' => {'href' => ['http', 'https', 'mailto'] },
                                'img' => {'href' => ['http', 'https', 'mailto'] } 
                              } 
        )
      self.content = self.trouble.html_safe
    end
  end

  def sanitize_trouble
    if self.trouble
      self.content = Sanitize.clean(self.content, 
        elements: ["a", "img", "strong", "li", "ul", "ol", "pre", "code", "h1", "h2", "h3", "div", "small", "p", "i", "hr"], 
        attributes: {'a' => ["target", "href", "title", "class", :data], 
          'img' => ['alt', 'title', 'src', "class", "style"], 
          "div" => ["class"], "h2" => ["style"],
          "p" => ["style"]
          },
        protocols: { 'a' => {'href' => ['http', 'https', 'mailto'] },
                                'img' => {'href' => ['http', 'https', 'mailto'] } 
                              } 
        )
      self.content = self.content.html_safe
    end
  end
end
