# frozen_string_literal: true

Factory.define(:ingredient) do |f|
  f.sequence(:name) { |n| "Ingredient #{n}" }
end
