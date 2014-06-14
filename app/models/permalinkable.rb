module Permalinkable

  extend ActiveSupport::Concern

  included do
    before_validation :set_permalink
    validates :permalink, presence: true, uniqueness: { case_sensitive: false }
    validates_format_of :permalink, :with => /\A[A-Za-z0-9\_\-]+\Z/
  end

  def to_param
    permalink
  end

  protected

  def set_permalink
    self.permalink = self.title.parameterize if permalink.blank? && !title.nil?
  end

end