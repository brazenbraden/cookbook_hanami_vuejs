# auto_register: false
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
          halt 422, { errors: request.params.errors }.to_json unless request.params.valid?

          response.body = repo.by_cookbook(request.params)
            .map(&:attributes).to_json
        end
      end
    end
  end
end
