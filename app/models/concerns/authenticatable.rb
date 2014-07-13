module Authenticatable
  extend ActiveSupport::Concern

  included do
    has_secure_password
  end

  def update_tracked_fields(ip_address)
    old_current, new_current = self.current_sign_in_at, Time.now.utc
    self.last_sign_in_at     = old_current || new_current
    self.current_sign_in_at  = new_current

    old_current, new_current = self.current_sign_in_ip, ip_address
    self.last_sign_in_ip     = old_current || new_current
    self.current_sign_in_ip  = new_current

    self.sign_in_count ||= 0
    self.sign_in_count += 1
  end

  def update_tracked_fields!(ip_address)
    update_tracked_fields(ip_address)
    save(validate: false) or raise "Melange Authenticatable could not save #{inspect}." \
          "Please make sure a model using authenticatable can be saved at sign in."
  end

  module ClassMethods

    def authenticate(email, password, ip_address)
      user = User.where(email: email).first
      if user && user.authenticate(password)
        user.update_tracked_fields!(ip_address)
        user
      else
        nil
      end
    end

  end

end