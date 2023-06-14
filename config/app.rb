# frozen_string_literal: true

require "hanami"
require "rack/cors"

module Cookbook
  class App < Hanami::App
    config.middleware.use :body_parser, :json
    config.actions.format :json

    config.middleware.use Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: [:get, :post, :patch, :put]
      end
    end

    environment(:development) do
      config.logger.options[:colorize] = true
    end

    environment(:production) do
      config.actions.cookies = {
        secure: true,
        httponly: true
      }
    end
  end
end
