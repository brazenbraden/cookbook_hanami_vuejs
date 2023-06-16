# frozen_string_literal: true

module Cookbook
  module Actions
    module Ingredients
      class Index < Cookbook::Action
        include Deps[repo: "repositories.ingredient"]

        params do
          optional(:page).value(:integer, gt?: 0)
          optional(:per_page).value(:integer, gt?: 0, lteq?: 100)
        end

        def handle(request, response)
          response.body = repo
            .ingredients
            .select(:id, :name)
            .order(:name)
            .page(request.params[:page] || 1)
            .per_page(request.params[:per_page] || 20)
            .to_a.map(&:to_h).to_json
        end
      end
    end
  end
end
