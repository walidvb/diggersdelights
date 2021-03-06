require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DiggersDelights
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
# Test framework
    config.generators.test_framework false

    # autoload lib path
    config.autoload_paths += %W(#{config.root}/lib)
    config.autoload_paths += [Rails.root.join('app', 'services')]
    config.autoload_paths += Dir["#{config.root}/lib/**/"]

    # don't generate RSpec tests for views and helpers
   config.generators do |g|
     g.test_framework :rspec, fixture: true
     g.fixture_replacement :fabrication
     g.view_specs false
     g.helper_specs false
     g.assets = false
     g.helper = false
   end
   config.assets.paths << Rails.root.join('vendor', 'assets', 'components')
   config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
   config.assets.paths << Rails.root.join('node_modules')
   
   config.assets.precompile += ['application.css, application.js']

  config.action_mailer.smtp_settings = {
    address: "smtp.sendgrid.net",
    port: 587,
    domain: Rails.application.secrets.domain_name,
    authentication: "plain",
    enable_starttls_auto: true,
    user_name: Rails.application.secrets.email_provider_username,
    password: Rails.application.secrets.email_provider_password
  }
  end
end
