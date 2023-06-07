# frozen_string_literal: true

RSpec.describe Cookbook::Actions::Ingredients::Update do
  let(:ingredients) { Hanami.app["persistence.rom"].relations[:ingredients] }
  let(:response) { subject.call(params) }
  let(:original_name) { "Flour" }
  let(:ingredient_id) do
    ingredients.insert(name: original_name)
  end

  before { ingredient_id }

  context "when given valid params" do
    let(:new_name) { "Sausage" }
    let(:params) do
      {
        id: ingredient_id,
        ingredient: { name: new_name }
      }
    end

    it "updates a ingredient name" do
      expect(ingredients.first[:name]).to eq(original_name)

      response

      expect(ingredients.first[:name]).to eq(new_name)
    end
  end
end
