require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
# require "active_record/railtie"
require 'neo4j/railtie'
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Vci
  class Application < Rails::Application

    config.generators do |g|
      g.orm             :neo4j
      config.neo4j.session_options = { basic_auth: { username: 'neo4j', password: 'v9a3bUhtJVwVQvb72sigW9tj$+,2/oa??E4c@(NXtg*V37&7LD'} }
      config.neo4j.session_type = :server_db
      config.neo4j.session_path = 'http://45.32.108.225:7474'
    end

    # Configure where the embedded neo4j database should exist
    # Notice embedded db is only available for JRuby
    # config.neo4j.session_type = :embedded_db  # default #server_db
    # config.neo4j.session_path = File.expand_path('neo4j-db', Rails.root)

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
