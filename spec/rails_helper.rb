ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'spec_helper'
require 'rspec/rails'
require 'webmock/rspec'

require 'capybara/poltergeist'

Capybara.javascript_driver = :poltergeist
Capybara.default_max_wait_time = 5

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
end
