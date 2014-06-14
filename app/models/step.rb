class Step < ActiveRecord::Base

  include Permalinkable

  has_many :next_edges, foreign_key: :previous_step_id, class_name: "Edge"
  has_many :previous_edges, foreign_key: :next_step_id, class_name: "Edge"
  has_many :previous_steps, through: :previous_edges
  has_many :next_steps, through: :next_edges

  before_validation :sanitize_content
  before_validation :sanitize_trouble

  # I need to scope the edges so that I only see ones for my operating system
  # Or ones that have no operating system in them. (or some other identifier)

  validates :title, :content, presence: true

  def final_step?
    self.final_step
  end

  def self.first_step
    Step.find_by(first_step: true)
  end

  private
  
  def sanitize_content
    if self.content
      self.content = sanitize_helper(self.content)
    end
  end

  def sanitize_trouble
    if self.trouble
      self.trouble = sanitize_helper(self.trouble)
    end
  end

  def sanitize_helper(dirty)
    Sanitize.clean(dirty,
                   elements: ["a", "img", "strong", "li", "ul", "ol", "pre", "code", "h1", "h2", "h3", "div", "small", "p", "i", "hr"],
                   attributes: {'a' => ["target", "href", "title", "class", :data],
                                'img' => ['alt', 'title', 'src', "class", "style"],
                                "div" => ["class"], "h2" => ["style"],
                                "p" => ["style"]
                                },
                   protocols: { 'a' => {'href' => ['http', 'https', 'mailto'] },
                                'img' => {'href' => ['http', 'https', 'mailto'] }
                                }
                   ).html_safe
  end

end
