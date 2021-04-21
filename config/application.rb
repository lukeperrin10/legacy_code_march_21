
require 'action_cable/engine'
Bundler.require(*Rails.groups)

module MyAwesomeApi
  class Application < Rails::Application
    config.load_defaults 5.1
    config.api_only = true
    config.generators  do |generate|
      generate.helper false
      generate.assets false
      generate.skip_routes true
      generate.view_specs false
      generate.helper_specs false
      generate.routing_specs false
      generate.controller_specs false
      generate.request_specs false
    end
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: %i[get post put delete]
      end
    end
  end
end
