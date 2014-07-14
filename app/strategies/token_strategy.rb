class TokenStrategy < ::Warden::Strategies::Base
  def valid?
    true
  end

  def authenticate!
    # TODO: Write code to authenticate against token.
    fail! :message => "strategies.token.failed"
#    success! user
  end
end

Warden::Strategies.add(:token, TokenStrategy)
