ENV["RAILS_ENV"] ||= 'test'
require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Checks for pending migrations before tests are run.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|

  # Include FactoryGirl helpers
  config.include FactoryGirl::Syntax::Methods

  # Lint factories before running tests
  config.before(:suite) do
    FactoryGirl.lint
  end

  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!

end
