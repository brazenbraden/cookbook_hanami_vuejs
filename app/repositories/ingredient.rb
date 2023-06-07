# frozen_string_literal: true

module Cookbook
  module Repositories
    class Ingredient < ::Cookbook::Repository[:ingredients]
      commands :create, update: :by_pk, delete: :by_pk
    end
  end
end
