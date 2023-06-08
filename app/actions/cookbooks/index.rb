# auto_register: false
# frozen_string_literal: true

module Cookbook
  module Actions
    module Cookbooks
      class Index < Cookbook::Action
        include Deps[repo: "repositories.cookbook"]

        params do
          optional(:page).value(:integer, gt?: 0)
          optional(:per_page).value(:integer, gt?: 0, lteq?: 100)
        end

        def handle(request, response)
          response.body = repo
            .by_page(
              page: request.params[:page],
              per_page: request.params[:per_page]
            ).to_a.to_h.to_json
        end
      end
    end
  end
end
