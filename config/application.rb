require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Killboard
  class Application < Rails::Application
    config.autoload_paths << Rails.root.join('lib', 'killboard')
  end
end
