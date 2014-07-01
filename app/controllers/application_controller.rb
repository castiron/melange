class ApplicationController < ActionController::Base
  protect_from_forgery
  skip_before_filter :verify_authenticity_token, :only => [:options]

  doorkeeper_for :all

end
