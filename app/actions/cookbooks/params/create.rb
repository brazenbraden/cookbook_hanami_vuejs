# frozen_string_literal: true

module Cookbook
  module Actions
    module Cookbooks
      module Params
        class Create < Hanami::Action::Params
          params do
            required(:cookbook).hash do
              required(:name).filled(:string)
            end
          end
        end
      end
    end
  end
end
