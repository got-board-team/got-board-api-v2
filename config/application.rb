require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
# require "action_mailer/railtie"
require "action_view/railtie"
# require "action_cable/engine"
# require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you"ve limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module GotBoardApiV2
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.api_only = true
    ActiveModelSerializers.config.adapter = :json_api # Default: `:attributes`

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins "*"
        resource "*", headers: :any, methods: %i[get post options]
      end
    end

    config.eager_load_paths += Dir.glob("#{config.root}/app/interactions/**/*")

    Raven.configure do |config|
      config.dsn = "https://fd4fcb2b7835450cbbf74bf6491a4ef0:71879023af06459f9ee823fca886efc2@sentry.io/211956"
    end
  end
end
