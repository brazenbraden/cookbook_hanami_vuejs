# frozen_string_literal: true

RSpec.describe Cookbook::Actions::Recipes::Update do
  let(:cookbook) { Hanami.app["persistence.rom"].relations[:cookbooks] }
  let(:recipe) { Hanami.app["persistence.rom"].relations["recipes"] }
  let(:response) { subject.call(params) }
  let(:recipe_name) { "My Recipe" }
  let(:recipe_id) do
    cookbook_id = cookbook.insert(name: "My cookbook")
    recipe.insert(name: recipe_name, blurb: "A blurb", cookbook_id: cookbook_id)
  end

  before { recipe_id }

  context "when given valid params" do
    let(:new_name) { "New recipe name" }
    let(:params) do
      {
        id: recipe_id,
        recipe: { name: new_name }
      }
    end

    it "updates a recipe name" do
      expect(recipe.first[:name]).to eq(recipe_name)

      response

      expect(recipe.first[:name]).to eq(new_name)
    end
  end
end
