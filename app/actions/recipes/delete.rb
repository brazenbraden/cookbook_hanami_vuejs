# frozen_string_literal: true

module Cookbook
  module Actions
    module Recipes
      class Delete < Cookbook::Action
        include Deps[repo: "repositories.recipe"]

        params do
          required(:id).value(:integer)
        end

        def handle(request, response)
          response.body = repo.delete(request.params[:id])
        end
      end
    end
  end
end