# frozen_string_literal: true

module Cookbook
  module Persistence
    module Relations
      class Steps < ROM::Relation[:sql]
        schema(:steps, infer: true) do
          associations do
            belongs_to :recipe
          end
        end
      end
    end
  end
end

