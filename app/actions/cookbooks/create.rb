# frozen_string_literal: true

module Cookbook
  module Actions
    module Cookbooks
      class Create < Cookbook::Action
        include Deps["persistence.rom"]

        before :validate_params
        # Alternative method using a block
        # before do |request, _|
        #   halt 422, request.params.errors.to_json unless request.params.valid?
        # end

        params Params::Create

        def handle(request, response)
          cookbook = rom.relations[:cookbooks].changeset(:create, request.params[:cookbook]).commit

          response.status = :created
          response.body = cookbook.to_json
        end

        private

        def validate_params(request, _response)
          halt 422, request.params.errors.to_json unless request.params.valid?
        end
      end
    end
  end
end
