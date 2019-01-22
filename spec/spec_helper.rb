require 'pry'
require 'simplecov'

require 'bundler/setup'
require 'simple_crudify'

SimpleCov.start

RSpec.configure do |config|
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
