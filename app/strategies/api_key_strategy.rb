class ApiKeyStrategy < ::Warden::Strategies::Base

  def valid?
    # Can't think of a case where we don't want to validate
    true
  end

  def headers
    pairs = env.select {|k,v| k.start_with? 'HTTP_'}
    .collect {|pair| [pair[0].sub(/^HTTP_/, '').gsub(/_/, '-'), pair[1]]}
    .sort
    headers = Hash[*pairs.flatten]
    headers
  end

  def authenticate!
    token, token_options = token_and_options(headers['AUTHORIZATION'])
    key = ApiKey.find_by({token: token})
    myvar = headers
    if key && key.valid_token?
      user = key.user
      if user && user.authenticatable?
        success! user
      else
        fail! :message => "invalid user"
      end
    else
      fail! :message => "invalid token"
    end
  end

  protected

  def token_and_options(header)
    token = header.to_s.match(/^Melange(.*)/) { |m| m[1] }
    if token
      begin
        values = Hash[token.split(',').map do |value|
            value.strip!                      # remove any spaces between commas and values
          key, value = value.split(/\=\"?/) # split key=value pairs
          value.chomp!('"')                 # chomp trailing " in value
          value.gsub!(/\\\"/, '"')          # unescape remaining quotes
          [key, value]
        end]
        [values.delete("token"), values]
      rescue => error
        raise UnprocessableHeader, error
      end
    else
      [nil,{}]
    end
  end

end

