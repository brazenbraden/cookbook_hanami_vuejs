# auto_register: false
# frozen_string_literal: true

module Cookbook
  module Actions
    module Ingredients
      class Create < Cookbook::Action
        include Deps[repo: "repositories.ingredient"]

        params do
          required(:ingredient).hash do
            required(:name).value(:string)
            optional(:calories).value(:integer)
            optional(:price).value(:float)
          end
        end

        def handle(request, response)
          response.body = repo.create(request.params[:ingredient])
          response.status = :created
        end
      end
    end
  end
end
