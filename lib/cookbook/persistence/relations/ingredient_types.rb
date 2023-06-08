# frozen_string_literal: true

module Cookbook
  module Persistence
    module Relations
      class IngredientTypes < ROM::Relation[:sql]
        schema(:ingredient_types, infer: true)

        def first_or_create(attributes)
          where(attributes).one!
        rescue ROM::TupleCountMismatchError
          by_pk(insert(attributes)).first.to_a
        end
      end
    end
  end
end
