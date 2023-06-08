# auto_register: false
# frozen_string_literal: true

module Cookbook
  module Actions
    module Ingredients
      class Update < Cookbook::Action
        include Deps[repo: "repositories.ingredient"]

        params do
          required(:id).value(:integer)
          required(:ingredient).hash do
            optional(:name).value(:string)
            optional(:calories).value(:integer)
            optional(:price).value(:float)
          end
        end

        def handle(request, response)
          response.body = repo.update(request.params[:id], request.params[:ingredient]).to_h.to_json
        end
      end
    end
  end
end
