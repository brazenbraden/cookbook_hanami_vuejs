# frozen_string_literal: true

RSpec.describe Cookbook::Actions::Recipes::Index do
  let(:response) { subject.call(params) }
  let(:body) { JSON.parse(response.body.first) }
  let(:params) do
    {
      page: page,
      per_page: per_page
    }
  end
  let(:repo) { Hanami.app["repositories.recipe"] }
  let(:page) { 1 }
  let(:per_page) { 10 }
  let(:recipes) do
    5.times { |i| Factory[:recipe, name: "Recipe #{i}"] }
  end

  before { recipes }

  context "with valid params" do
    let(:expected_recipes) { 5.times.map { |i| "Recipe #{i}" } }

    it "returns the full list of recipes" do
      recipe_names = body.map { |recipe| recipe["name"] }

      expect(recipe_names).to eq(expected_recipes)
    end
  end

  context "with pagination" do
    let(:per_page) { 3 }
    let(:expected_recipes) { 3.times.map { |i| "Recipe #{i}" } }

    it "returns a paginated list of recipes" do
      recipe_names = body.map { |recipe| recipe["name"] }

      expect(repo.all.count).to eq(5)
      expect(recipe_names.count).to eq(3)
      expect(recipe_names).to eq(expected_recipes)
    end
  end

  xcontext "when scoped to a cookbook" do
  end
end
