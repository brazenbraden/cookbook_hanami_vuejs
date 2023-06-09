# frozen_string_literal: true

module Cookbook
  module Actions
    module Recipes
      class Index < Cookbook::Action
        include Deps[repo: "repositories.recipe"]

        params do
          required(:cookbook_id).value(:integer)
          optional(:page).value(:integer, gt?: 0)
          optional(:per_page).value(:integer, gt?: 0, lteq?: 100)
        end

        def handle(request, response)
          response.body = repo.by_cookbook(request.params).to_h.to_json
        end
      end
    end
  end
end
