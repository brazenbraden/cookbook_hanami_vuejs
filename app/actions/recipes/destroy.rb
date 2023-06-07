# auto_register: false
# frozen_string_literal: true

module Cookbook
  module Actions
    module Recipes
      class Destroy < Cookbook::Action
        include Deps[repo: "repositories.recipe"]

        params do
          required(:id).value(:integer)
        end

        def handle(request, response)
          response.status = 404 if repo.delete(request.params[:id]).nil?
        end
      end
    end
  end
end
