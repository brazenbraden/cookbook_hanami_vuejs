# frozen_string_literal: true

Factory.define(:recipe) do |f|
  f.sequence(:name) { |n| "Recipe #{n}" }
  f.blurb { "A recipe summary description" }
  f.duration { rand(1000..9000) }
end
