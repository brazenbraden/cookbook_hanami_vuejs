# frozen_string_literal: true

module Cookbook
  module Repositories
    class Cookbook < Cookbook::Repository[:cookbooks]
      commands :create, update: :by_pk, delete: :by_pk

      def by_page(page:, per_page:)
        cookbooks
          .select(:name)
          .order(:name)
          .page(page || 1)
          .per_page(per_page || 20)
          .to_a
      end
    end
  end
end
