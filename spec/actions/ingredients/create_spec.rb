# frozen_string_literal: true

RSpec.describe Cookbook::Actions::Ingredients::Create do
  let(:params) do
    {
      ingredient: {
        name: "Rice",
        calories: 10,
        price: 0.50
      }
    }
  end

  it_behaves_like "a create action", relation: :ingredients
end
