# frozen_string_literal: true

module Cookbook
  module Actions
    module Recipes
      class Create < Cookbook::Action
        include Deps[repo: "repositories.recipe"]

        params do
          required(:cookbook_id).value(:integer)
          required(:name).value(:string)
          required(:blurb).value(:string)
          optional(:duration).value(:integer, gt?: 0)
        end

        def handle(request, response)
          halt 422 unless request.params.valid?

          response.body = repo.create(request.params)
        end
      end
    end
  end
end
