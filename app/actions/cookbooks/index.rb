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
          halt 422, { errors: request.params.errors }.to_json unless request.params.valid?

          response.body = repo
            .by_page(
              page: request.params[:page],
              per_page: request.params[:per_page]
            ).to_a.map(&:attributes).to_json
        end
      end
    end
  end
end
