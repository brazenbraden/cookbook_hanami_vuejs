# frozen_string_literal: true

module Cookbook
  module Repositories
    class Recipe < ::Cookbook::Repository[:recipes]
      commands :create, update: :by_pk, delete: :by_pk

      def all(params = {})
        recipes
          .select(:id, :name, :blurb)
          .order(:name)
          .page(params[:page] || 1)
          .per_page(params[:per_page] || 20)
          .to_a
      end

      def full_recipe_for(id)
        recipes
          .by_pk(id)
          .combine([:steps, { ingredients: :ingredient_types }])
          .to_a
          .first
      end
    end
  end
end
