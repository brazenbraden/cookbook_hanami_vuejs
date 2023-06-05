# frozen_string_literal: true

module Cookbook
  module Actions
    module Cookbooks
      class Update < Cookbook::Action
        include Deps[
          # "persistence.rom",
          repo: "repositories.cookbook"
        ]

        before { |request, _| halt 422 unless request.params.valid? }

        params do
          required(:id).value(:integer)
        end

        def handle(request, response)
          binding.pry
          repo.update(params[:id], params[:name])

          response.format = :json
          response.body = { state: "success" }.to_json
        end
      end
    end
  end
end
