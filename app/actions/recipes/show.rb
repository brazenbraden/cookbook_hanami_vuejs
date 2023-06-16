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
          record = repo.full_recipe_for(request.params[:id])
          raise ROM::TupleCountMismatchError if record.nil?

          response.body = record.to_h.to_json
        end
      end
    end
  end
end
