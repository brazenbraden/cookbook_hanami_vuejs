# frozen_string_literal: true

module Cookbook
  module Repositories
    class Cookbook < Cookbook::Repository[:cookbooks]
      commands :create, update: :by_pk, delete: :by_pk

      def all
        cookbooks.select(:name).order(:name)
      end

      def find(id)
        all.by_pk(id)
      end
    end
  end
end
