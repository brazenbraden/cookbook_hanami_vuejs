# frozen_string_literal: true

module Cookbook
  module Repositories
    class Recipe < ::Cookbook::Repository[:recipes]
      commands :create, update: :by_pk, delete: :by_pk

      def by_cookbook(params)
        recipes
          .combine(:cookbook)
          .where(cookbook_id: params[:cookbook_id])
          .select(:name, :blurb, :cookbook_id)
          .order(:name)
          .page(params[:page] || 1)
          .per_page(params[:per_page] || 20)
          .to_a
      end

      def full_recipe_for(id)
        recipes
          .by_pk(id)
          .combine([:cookbooks, :steps, { ingredients: :ingredient_types }])
          .to_a
      end
    end
  end
end
