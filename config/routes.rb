# frozen_string_literal: true

module Cookbook
  class Routes < Hanami::Routes
    root to: "cookbooks.index"
    get "/cookbooks/:id", to: "cookbooks.show"
    post "/cookbooks", to: "cookbooks.create"
    patch "/cookbooks/:id", to: "cookbooks.update"
  end
end
