# frozen_string_literal: true

RSpec.describe Cookbook::Actions::Ingredients::Update do
  let(:params) do
    {
      id: id,
      ingredient: { name: new_value }
    }
  end

  it_behaves_like "a update action", relation: :ingredients
end
