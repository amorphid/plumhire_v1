ENV["RAILS_ENV"] ||= "test"

require File.expand_path("../../config/environment", __FILE__)
require "rspec/rails"
require "rspec/autorun"
require "capybara/rspec"
require "sidekiq/testing/inline"

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }
Dir[Rails.root.join("spec/fabricators/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  config.before(:each) { ActionMailer::Base.deliveries.clear }
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"
  config.use_transactional_fixtures = true
end
