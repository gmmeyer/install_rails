class Step < ActiveRecord::Base

  include Permalinkable

  has_many :next_edges, foreign_key: :previous_step_id, class_name: "Edge"
  has_many :previous_edges, foreign_key: :next_step_id, class_name: "Edge"
  has_many :previous_steps, through: :previous_edges, source: :previous_step
  has_many :next_steps, through: :next_edges, source: :next_step

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
    !!self.first_step
  end

  #replace these with scopes
  def get_previous_edges(user)
    return if self.first_step?
    edges = []
    self.previous_edges.includes(:previous_step).each do |edge|
      edges << edge if edge.follow?(user = user)
    end
    edges
  end

  def get_previous_step(user)
    return if self.first_step?
    edges = get_previous_edges(user = user)

    edges.map{|edge| edge.previous_step}
  end

  def get_next_edges(user)
    edges = []
    self.next_edges.includes(:next_step).each do |edge|
      edges << edge if edge.follow?(user = user)
    end

    if self.save_user_choice
      edges = self.next_edges
    end

    edges
  end

  def get_next_steps(user)
    edges = get_next_edges(user = user)

    edges.map{|edge| edge.next_step}
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
