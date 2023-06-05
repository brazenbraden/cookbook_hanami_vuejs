# auto_register: false
# frozen_string_literal: true

require "hanami/action"

module Cookbook
  class Action < Hanami::Action
    handle_exception ROM::TupleCountMismatchError => :handle_not_found

    private

    def handle_not_found(_request, response, exception)
      raise exception if Hanami.env?(:development)

      response.status = 404
      response.body = { error: "not_found" }.to_json
    end
  end
end
