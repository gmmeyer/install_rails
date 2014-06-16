class Step < ActiveRecord::Base

  include Permalinkable

  has_many :next_edges, foreign_key: :previous_step_id, class_name: "Edge"
  has_many :previous_edges, foreign_key: :next_step_id, class_name: "Edge"
  has_many :previous_steps, through: :previous_edges
  has_many :next_steps, through: :next_edges

  before_validation :sanitize_content
  before_validation :sanitize_trouble

  validates :title, :content, presence: true

  def final_step?
    self.final_step
  end

  def self.first_step
    Step.find_by(first_step: true)
  end

  def first_step?
    self.first_step
  end

  #replace these with scopes
  def get_previous_step
    if self.previous_edges.count == 1
      return self.previous_steps.first
    elsif self.first_step?
      return
    else
      self.previous_edges.each do |edge|
        return edge.previous_step if edge.follow?(user = current_user)
      end
    end

    #Only after checking everything else can we say that this is the answer
    if self.previous_edges[0].button_text
      return self.previous_steps.first
    end

  end

  def get_next_steps
    if self.next_edges.count == 1
      return self.next_steps
    elsif self.final_step?
      return
    elsif self.next_edges[0].button_text
      return self.previous_steps
    else
      self.previous_edges.each do |edge|
        return edge.next_step if edge.follow?(user = current_user)
      end
    end

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
