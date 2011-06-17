# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  # == Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  config.mock_with :rspec

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  #Test DB Checks - from Dan Chak's Enterprise Rails
  #def test_for_db_error(error_message, &block)
  #  begin
  #    yield
  #  rescue ActiveRecord::StatementInvalid
  #    database_threw_error = true
  #  rescue
  #    something_else_threw_error = true
  #  end
  #  assert !something_else_threw_error, "There is an error in our test code"
  #  assert database_threw_error && !something_else_threw_error, error_messsage
  #end

end
