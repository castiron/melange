class ApplicationController < ActionController::Base
  protect_from_forgery
  skip_before_filter :verify_authenticity_token, :only => [:options]
  before_action :authenticate_user!

  def authenticate_user!

  end

end
