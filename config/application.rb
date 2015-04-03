require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PersonalPage
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
    config.active_record.raise_in_transactional_callbacks = true
    
    uglifier                     = Uglifier.new output: { comments: :copyright }
    config.assets.compile        = true
    config.assets.debug          = false
    config.assets.js_compressor  = uglifier
    config.assets.css_compressor = :sass
    config.middleware.use Rack::Deflater
    config.middleware.insert_before ActionDispatch::Static, Rack::Deflater
    config.middleware.use HtmlCompressor::Rack,
      compress_css: true,
      compress_javascript: true,
      css_compressor: Sass,
      enabled: true,
      javascript_compressor: uglifier,
      preserve_line_breaks: false,
      remove_comments: true,
      remove_form_attributes: false,
      remove_http_protocol: false,
      remove_https_protocol: false,
      remove_input_attributes: true,
      remove_intertag_spaces: false,
      remove_javascript_protocol: true,
      remove_link_attributes: true,
      remove_multi_spaces: true,
      remove_quotes: true,
      remove_script_attributes: true,
      remove_style_attributes: true,
      simple_boolean_attributes: true,
      simple_doctype: false 
  end
end
