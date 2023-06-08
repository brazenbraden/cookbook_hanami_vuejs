# auto_register: false
# frozen_string_literal: true

module Cookbook
  module Actions
    module Recipes
      class Show < Cookbook::Action
        include Deps[repo: "repositories.recipe"]

        params do
          required(:id).value(:integer)
        end

        def handle(request, response)
          response.body = repo.full_recipe_for(request.params[:id]).to_h.to_json
        end
      end
    end
  end
end
