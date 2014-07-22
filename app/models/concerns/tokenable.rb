module Tokenable
  extend ActiveSupport::Concern

  included do
    before_validation :generate_token
    before_validation :set_expires_at
    validates :token, presence: true
  end

  def valid_token?
    self.expires_at > Time.now
  end

  protected

  def refresh
    self.expires_at += 10.days
  end

  def set_expires_at
    self.expires_at = Time.now
    self.refresh
  end

  def generate_token
    begin
      self.token = SecureRandom.hex
    end while self.class.exists?(token: token)
  end

  module ClassMethods
  end

end