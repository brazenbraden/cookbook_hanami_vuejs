# frozen_string_literal: true

module Cookbook
  module Actions
    module Cookbooks
      class Update < Cookbook::Action
        include Deps[repo: "repositories.cookbook"]

        before { |request, _| halt 422 unless request.params.valid? }

        params do
          required(:id).value(:integer)
          required(:cookbook).hash do
            required(:name).value(:string)
          end
        end

        def handle(request, response)
          response.body = repo.update(request.params[:id], request.params[:cookbook]).attributes.to_json
        end
      end
    end
  end
end
