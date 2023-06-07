# frozen_string_literal: true

RSpec.describe Cookbook::Actions::Recipes::Update do
  let(:params) do
    {
      id: id,
      recipe: { name: new_value }
    }
  end

  it_behaves_like "a update action", relation: :recipes
end
