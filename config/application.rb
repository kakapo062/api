require_relative "boot"

require "rails/all"
require "graphiql/rails" # 追加する

Bundler.require(*Rails.groups)

module Myapp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    config.api_only = true
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore
    config.debug_exception_response_format = :default
    config.middleware.use(Rack::Deflater)
  end
end
