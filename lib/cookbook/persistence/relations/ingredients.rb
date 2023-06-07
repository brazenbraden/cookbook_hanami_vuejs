# frozen_string_literal: true

module Cookbook
  module Persistence
    module Relations
      class Ingredients < ROM::Relation[:sql]
        schema(:ingredients, infer: true)

        use :pagination
        per_page 20
      end
    end
  end
end
