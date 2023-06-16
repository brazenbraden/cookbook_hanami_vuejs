# frozen_string_literal: true

RSpec.describe Cookbook::Actions::Recipes::Destroy do
  it_behaves_like "a destroy action", relation: :recipes
end
