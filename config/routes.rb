# frozen_string_literal: true

module Cookbook
  class Routes < Hanami::Routes
    root to: "cookbooks.index"
    get "/cookbooks/:id", to: "cookbooks.show"
    post "/cookbooks", to: "cookbooks.create"
    patch "/cookbooks/:id", to: "cookbooks.update"

    scope "cookbooks/:cookbook_id" do
      get "/recipes", to: "recipes.index"
      post "/recipes", to: "recipes.create"
    end
    patch "/recipes/:id", to: "recipes.update"
    get "/recipes/delete", to: "recipes.delete"
    get "/cookbooks/delete", to: "cookbooks.delete"
  end
end
