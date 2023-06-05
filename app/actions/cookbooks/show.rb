# frozen_string_literal: true

module Cookbook
  module Actions
    module Cookbooks
      class Show < Cookbook::Action
        include Deps["persistence.rom"]

        params do
          required(:id).value(:integer)
        end

        def handle(request, response)
          cookbook = rom.relations[:cookbooks].by_pk(
            request.params[:id]
          ).one!

          response.body = cookbook.to_json
        end
      end
    end
  end
end
