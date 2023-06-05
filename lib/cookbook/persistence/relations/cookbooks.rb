# frozen_string_literal: true

module Cookbook
  module Persistence
    module Relations
      class Cookbooks < ROM::Relation[:sql]
        schema(:cookbooks, infer: true)

        use :pagination
        per_page 5
      end
    end
  end
end
