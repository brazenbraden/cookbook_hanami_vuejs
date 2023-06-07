# frozen_string_literal: true

RSpec.describe Cookbook::Actions::Recipes::Index do
  let(:cookbook) { Hanami.app["persistence.rom"].relations["cookbooks"] }
  let(:recipe) { Hanami.app["persistence.rom"].relations["recipes"] }
  let(:response) { subject.call(params) }
  let(:body) { JSON.parse(response.body.first) }

  let(:cookbook1_id) { cookbook.insert(name: "Cookbook 1") }
  let(:cookbook1_recipes) do
    5.times do |i|
      recipe.insert(
        name: "Recipe #{i}",
        blurb: "Description of recipe #{i}",
        duration: 1000,
        cookbook_id: cookbook1_id
      )
    end
  end

  let(:cookbook2_id) { cookbook.insert(name: "Cookbook 2") }
  let(:cookbook2_recipes) do
    5.times do |i|
      recipe.insert(
        name: "Recipe #{i}",
        blurb: "Description of recipe #{i}",
        duration: 1000,
        cookbook_id: cookbook2_id
      )
    end
  end

  before do
    cookbook1_recipes
    cookbook2_recipes
  end

  context "with valid params" do
    let(:params) do
      {
        cookbook_id: cookbook1_id
      }
    end
    let(:expected_recipes) { 5.times.map { |i| "Recipe #{i}" } }

    it "returns the full list of recipes" do
      recipe_names = body.map { |recipe| recipe["name"] }

      expect(recipe_names).to eq(expected_recipes)
    end
  end

  context "with pagination" do
    let(:params) do
      {
        cookbook_id: cookbook1_id,
        page: 1,
        per_page: 3
      }
    end
    let(:expected_recipes) { 3.times.map { |i| "Recipe #{i}" }}

    it "returns a paginated list of recipes" do
      recipe_names = body.map { |recipe| recipe["name"] }

      expect(recipe.to_a.count).to eq(10)
      expect(recipe_names.count).to eq(3)
      expect(recipe_names).to eq(expected_recipes)
    end
  end

  context "when scoped to a cookbook" do
    let(:params) do
      {
        cookbook_id: cookbook2_id
      }
    end

    it "fetches only the recipies in the corresponding cookbook" do
      cookbook_ids = body.map { |recipe| recipe["cookbook_id"] }.uniq

      expect(cookbook_ids).to eq([cookbook2_id])
      expect(body.count).to eq(5)
    end
  end
end
