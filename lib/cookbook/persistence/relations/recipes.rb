# frozen_string_literal: true

module Cookbook
  module Persistence
    module Relations
      class Recipes < ROM::Relation[:sql]
        schema(:recipes, infer: true) do
          associations do
            belongs_to :cookbook
          end
        end

        use :pagination
        per_page 20
      end
    end
  end
end