# frozen_string_literal: true

module Cookbook
  module Persistence
    module Relations
      class RecipeIngredients < ROM::Relation[:sql]
        schema(:recipe_ingredients, infer: true) do
          associations do
            belongs_to :recipe
            belongs_to :ingredient
          end
        end
      end
    end
  end
end
