# frozen_string_literal: true

module Cookbook
  module Actions
    module Recipes
      class Create < Cookbook::Action
        include Deps[repo: "repositories.recipe"]

        params do
          required(:recipe).hash do
            required(:name).value(:string)
            required(:blurb).value(:string)
            optional(:duration).value(:integer, gt?: 0)
          end
        end

        def handle(request, response)
          response.body = repo.create(request.params[:recipe])
          response.status = :created
        end
      end
    end
  end
end
