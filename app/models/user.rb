class User < ActiveRecord::Base
  def self.new_guest
    new { |u| u.guest = true }
  end
end
