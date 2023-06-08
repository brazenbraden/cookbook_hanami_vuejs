# frozen_string_literal: true

module Cookbook
  module Persistence
    module Relations
      class Ingredients < ROM::Relation[:sql]
        schema(:ingredients, infer: true) do
          associations do
            belongs_to :ingredient_type, foreign_key: :type_id
            has_many :recipes, through: :recipe_ingredients
          end
        end

        use :pagination
        per_page 20
      end
    end
  end
end
