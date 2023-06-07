# frozen_string_literal: true

RSpec.describe Cookbook::Actions::Recipes::Delete do
  let(:cookbook) { Hanami.app["persistence.rom"].relations["cookbooks"] }
  let(:recipe) { Hanami.app["persistence.rom"].relations["recipes"] }
  let(:response) { subject.call(params) }
  let(:recipe_id) do
    cookbook_id = cookbook.insert(name: "My cookbook")
    recipe.insert(cookbook_id: cookbook_id, name: "My recipe", blurb: "A blurb")
  end

  context "with valid recipe id" do
    let(:params) do
      { id: recipe_id }
    end

    it "deletes a recipe" do
      expect(response).to be_successful
      expect(recipe.to_a.count).to eq(0)
    end
  end

  context "with invalid recipe id" do
    let(:params) do
      { id: 233 }
    end

    before { recipe_id }

    xit "fails with 404" do
    end

    it "does not delete any recipe records" do
      expect(recipe.to_a.count).to eq(1)
    end
  end
end
