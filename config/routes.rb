# frozen_string_literal: true

module Cookbook
  class Routes < Hanami::Routes
    root to: "cookbooks.index"
    get "/cookbooks/:id", to: "cookbooks.show"
    post "/cookbooks", to: "cookbooks.create"
    patch "/cookbooks/:id", to: "cookbooks.update"
    delete "/cookbooks/:id", to: "cookbooks.destroy"

    scope "cookbooks/:cookbook_id" do
      get "/recipes", to: "recipes.index"
      get "/recipes/:id", to: "recipes.show"
      post "/recipes", to: "recipes.create"
      patch "/recipes/:id", to: "recipes.update"
      delete "/recipes/:id", to: "recipes.destroy"
    end
  end
end
