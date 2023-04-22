require_relative "boot"

require "rails/all"
require "graphiql/rails" # 追加する
require "sprockets/railtie"
require "rack/cors" # 追加する

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
    config.assets.enabled = true
    config.assets.paths << Rails.root.join("node_modules")

    # CORS設定を追加する
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'localhost:3000' # フロントエンドのオリジンを指定 (Next.jsのデフォルトポートは3000)

        resource '*',
          headers: :any,
          methods: [:get, :post, :put, :patch, :delete, :options, :head], # 許可するHTTPメソッドを指定
          expose: ['access-token', 'expiry', 'token-type', 'uid', 'client'], # 任意で追加するヘッダー情報
          credentials: true
      end
    end
  end
end
