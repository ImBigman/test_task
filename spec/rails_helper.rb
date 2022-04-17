# frozen_string_literal: true

require 'spec_helper'

ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../config/environment', __dir__)
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'
require 'sidekiq/testing'
require 'webmock/rspec'
require 'factory_bot'
require 'shoulda-matchers'
require 'database_cleaner'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }


Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

RSpec.configure do |config|
  config.expose_dsl_globally = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.shared_context_metadata_behavior = :apply_to_host_groups
end
