# frozen_string_literal: true

RSpec.describe Cookbook::Actions::Ingredients::Destroy do
  it_behaves_like "a destroy action", relation: :ingredients
end
