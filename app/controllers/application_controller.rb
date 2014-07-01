class ApplicationController < ActionController::Base
  protect_from_forgery
  skip_before_filter :verify_authenticity_token, :only => [:options]
  before_filter :authenticate_cors_user
  after_filter :cors_set_access_control_headers

  def authenticate_cors_user
    if request.xhr? && !user_signed_in?
      error = { :error => "You must be logged in." }
      render :json => error, :status => 401
    end
  end

  # For all responses in this controller, return the CORS access control headers.
  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Max-Age'] = "1728000"
  end

  # If this is a preflight OPTIONS request, then short-circuit the
  # request, return only the necessary headers and return an empty
  # text/plain.
  def cors_preflight_check
    if request.method == :options
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version'
      headers['Access-Control-Max-Age'] = '1728000'
      render :text => '', :content_type => 'text/plain'
    end
  end

  def options
    render :text => '', :content_type => 'text/plain'
  end

end
