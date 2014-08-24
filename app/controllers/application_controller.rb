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
    @current_user = warden.authenticate!(:scope => :user, :store => false)
  end

  protected

  def set_pagination_headers(name, options = {})
    scope = instance_variable_get("@#{name}")
    request_params = request.query_parameters

    page = {}
    page[:total_pages] = scope.total_pages
    page[:first_page] = scope.first_page?
    page[:last_page] = scope.last_page?
    page[:current_page] = scope.current_page
    headers[:Pagination] = page.to_json
  end

end
