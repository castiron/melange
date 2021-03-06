class UnauthorizedController < ActionController::Metal
  include ActionController::UrlFor
  include ActionController::Redirecting
  include Rails.application.routes.url_helpers
  include Rails.application.routes.mounted_helpers

  def self.call(env)
    @respond ||= action(:respond)
    @respond.call(env)
  end

  def respond
    myvar = env
    self.status = 401
    self.content_type = request.format.to_s
    self.response_body = { :errors => ['Login token is invalid.'] }.to_json
  end
end