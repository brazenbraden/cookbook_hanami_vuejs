# frozen_string_literal: true

module Cookbook
  module Actions
    module Cookbooks
      class Create < Cookbook::Action
        include Deps[repo: "repositories.cookbook"]

        params Params::Create

        def handle(request, response)
          response.body = repo.create(request.params[:cookbook]).to_json
          response.status = :created
        end
      end
    end
  end
end
