# frozen_string_literal: true

Factory.define(:cookbook) do |f|
  # f.name "John"
  f.sequence(:name) { |n| "Cookbook #{n}" }
end
