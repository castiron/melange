class ApplicationController < ActionController::Base
  protect_from_forgery
  skip_before_filter :verify_authenticity_token, :only => [:options]

  prepend_before_filter :authenticate!

  helper_method :warden, :signed_in?, :current_user

  def signed_in?
    !current_user.nil?
  end

  def current_user
    warden.user
  end

  def warden
    request.env['warden']
  end

  def authenticate!
    warden.authenticate!
  end

end
