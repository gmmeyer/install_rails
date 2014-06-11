class StepContent < ActiveRecord::Base
  has_many :steps
  before_save :set_friendly_name
  before_create :set_friendly_name

  before_validation :sanitize_content

  validates :title, :content, presence: true

  def to_param
    # we wanna keep the urls friendly and usable, not just random ints
    [id, self.step_name].join("-")
  end

  # Need to sanitize input.
  # In controller, we need a method to see how to arrange next steps.
  # this gem: https://github.com/rgrove/sanitize seems pretty up to the task

  # private
  def set_friendly_name
    self.step_name = title.parameterize
  end

  def sanitize_content

    self.content = Sanitize.clean(self.content, 
      elements: ["a", "img", "strong"], 
      attributes: {'a' => ["href", "title", "class"], 'img' => ['alt', 'title', 'src', "class"]},
      protocols: { 'a' => {'href' => ['http', 'https', 'mailto'] },
                              'img' => {'href' => ['http', 'https', 'mailto'] } 
                            } 
      )

  end
end
