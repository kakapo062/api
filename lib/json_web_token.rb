# app/lib/json_web_token.rb
require 'jwt'

class JsonWebToken
  def self.decode_and_verify(token)
    JWT.decode(
      token,
      JWT.base64url_decode(ENV['AUTH0_PUBLIC_KEY']),
      true,
      { algorithm: 'RS256', aud: ENV['AUTH0_API_AUDIENCE'], verify_aud: true }
    )
  end
end
