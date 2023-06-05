# frozen_string_literal: true

require "hanami"

module Cookbook
  class App < Hanami::App
    config.middleware.use :body_parser, :json
    config.actions.format :json

    environment(:production) do
      config.actions.cookies = {
        secure: true,
        httponly: true
      }
    end
  end
end
