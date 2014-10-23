require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
%w[
  action_controller
  action_mailer
  active_record
  sprockets
].each { |f| require "#{ f }/railtie" }

Bundler.require *Rails.groups

module DevFuBase
  class Application < Rails::Application
    config.active_support.escape_html_entities_in_json = true
    # config.autoload_paths                             += %W[ #{ config.root }/lib ]
    config.responders.flash_keys                       = [ :success, :danger ]
    config.sass.preferred_syntax                       = :sass
    config.time_zone                                   = 'Arizona'
  end
end

I18n.enforce_available_locales = true
