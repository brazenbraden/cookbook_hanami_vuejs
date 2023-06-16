# frozen_string_literal: true

module Cookbook
  module Persistence
    module Relations
      class Cookbooks < ROM::Relation[:sql]
        schema(:cookbooks, infer: true) do
          associations do
            # has_many :recipes
          end
        end

        use :pagination
        per_page 20
      end
    end
  end
end
