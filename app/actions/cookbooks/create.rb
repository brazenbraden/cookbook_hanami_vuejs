# auto_register: false
# frozen_string_literal: true

module Cookbook
  module Actions
    module Cookbooks
      class Create < Cookbook::Action
        include Deps[repo: "repositories.cookbook"]

        before :validate_params

        params Params::Create

        def handle(request, response)
          response.body = repo.create(request.params[:cookbook]).to_json
          response.status = :created
        end

        private

        def validate_params(request, _response)
          halt 422, request.params.errors.to_json unless request.params.valid?
        end
      end
    end
  end
end
