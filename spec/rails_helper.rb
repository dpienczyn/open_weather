require 'spec_helper'

ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../config/environment', __dir__)

abort("The Rails environment is running in production mode!") if Rails.env.production?

require "rspec/rails"
require "devise"
require "support/shoulda_matchers"
require "support/controller_macros"
require "support/factory_bot_extensions"

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

FactoryBot::SyntaxRunner.class_eval do
  include FactoryBotExtensions
end

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.include(Devise::Test::ControllerHelpers, type: :controller)
  config.include(ControllerMacros, type: :controller)
  config.include(FactoryBot::Syntax::Methods)
end
