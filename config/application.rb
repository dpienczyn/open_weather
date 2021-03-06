require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
Dotenv::Railtie.load if Rails.env.development? || Rails.env.test?

module OpenWeather
  class Application < Rails::Application
    config.load_defaults 6.1
  end
end
