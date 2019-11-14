require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

module OE25MedicalSchedule
  class Application < Rails::Application
    config.load_defaults 6.0
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
    config.i18n.available_locales = :en
    config.i18n.default_locale = :en
    config.middleware.use I18n::JS::Middleware
  end
end
