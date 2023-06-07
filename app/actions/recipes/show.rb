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
          response.body = repo.recipes.by_pk(request.params[:id]).one!.attributes.to_json
        end
      end
    end
  end
end
