# frozen_string_literal: true

module Cookbook
  module Actions
    module Recipes
      class Update < Cookbook::Action
        include Deps[repo: "repositories.recipe"]

        params do
          required(:id).value(:integer)
          required(:recipe).hash do
            optional(:name).value(:string)
            optional(:blurb).value(:string)
            optional(:duration).value(:integer, gt?: 0)
          end
        end

        def handle(request, response)
          response.body = repo.update(request.params[:id], request.params[:recipe]).to_h.to_json
        end
      end
    end
  end
end
