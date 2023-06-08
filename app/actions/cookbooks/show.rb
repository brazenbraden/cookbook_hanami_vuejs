# auto_register: false
# frozen_string_literal: true

module Cookbook
  module Actions
    module Cookbooks
      class Show < Cookbook::Action
        include Deps[repo: "repositories.cookbook"]

        params do
          required(:id).value(:integer)
        end

        def handle(request, response)
          response.body = repo.cookbooks.by_pk(
            request.params[:id]
          ).one!.to_h.to_json
        end
      end
    end
  end
end
