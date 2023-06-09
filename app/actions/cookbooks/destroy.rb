# frozen_string_literal: true

module Cookbook
  module Actions
    module Cookbooks
      class Destroy < Cookbook::Action
        include Deps[repo: "repositories.cookbook"]

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
