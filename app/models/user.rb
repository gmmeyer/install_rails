require "bcrypt"
class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessor :password_confirmation

  validates :password, length: { minimum: 6, allow_nil: true }, unless: :guest?
  validates :token, :username, :password_digest , presence: true, unless: :guest?
  validates :username, :token, uniqueness: true, unless: :guest?
  validate :password_confirmation_check

  before_validation :ensure_token

  def self.new_guest
    new { |u| u.guest = true }
  end

  def self.generate_token
    SecureRandom::urlsafe_base64(32)
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    user.try(:is_password?, password) ? user : nil
  end

  def admin?
    admin
  end

  def guest?
    guest
  end

  def is_password(password)
    BCrypt::Password.new(self.password_digest).is_password?(unencrypted_password)
  end

  def reset_token!
    self.token = self.class.generate_token
    self.save!
    self. token
  end

  def password=(unencrypted_password)
    if unencrypted_password.present?
      @password = unencrypted_password
      self.password_digest = BCrypt::Password.create(unencrypted_password)
    end
  end

  private
  def ensure_token
    self.token ||= self.class.generate_token
  end

  def password_confirmation_check
    unless self.guest || self.password == self.password_confirmation
      errors.add(:password, "Your passwords must match")
    end
  end
end
