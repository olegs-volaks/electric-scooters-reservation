require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ElectricScootersReservation
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    config.time_zone = "Europe/Riga"
    # config.eager_load_paths << Rails.root.join("extras")
    I18n.available_locales = [:en, :lv]
    config.i18n.default_locale = :lv

    config.action_mailer.default_url_options = { host: 'example.com' }
  end
end
