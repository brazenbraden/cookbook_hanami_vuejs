# auto_register: false
# frozen_string_literal: true

module Cookbook
  module Actions
    module Cookbooks
      class Update < Cookbook::Action
        include Deps[repo: "repositories.cookbook"]

        params do
          required(:id).value(:integer)
          required(:cookbook).hash do
            required(:name).value(:string)
          end
        end

        def handle(request, response)
          response.body = repo.update(request.params[:id], request.params[:cookbook])
          response.body = { state: "success" }.to_json
        end
      end
    end
  end
end
