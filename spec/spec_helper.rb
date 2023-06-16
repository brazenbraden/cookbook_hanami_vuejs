# frozen_string_literal: true

require "pathname"
SPEC_ROOT = Pathname(__dir__).realpath.freeze

ENV["HANAMI_ENV"] ||= "test"
require "hanami/prepare"

require "pry"
require "rom-factory"

# require_relative "support/rspec"
# require_relative "support/requests"
# require_relative "support/database_cleaner"

Factory = ROM::Factory.configure do |config|
  config.rom = Hanami.app["persistence.rom"]
end

Dir["./spec/support/**/*.rb"].sort.each { |f| require f }
