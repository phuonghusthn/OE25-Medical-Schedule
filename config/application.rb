require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

module OE25MedicalSchedule
  class Application < Rails::Application
    config.load_defaults 6.0
    config.assets.paths << Rails.root.join("vendor", "assets")
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
    config.i18n.available_locales = :en
    config.i18n.default_locale = :en
    config.middleware.use I18n::JS::Middleware
    config.action_view.embed_authenticity_token_in_remote_forms = true
    config.active_job.queue_adapter = :sidekiq
  end
end
