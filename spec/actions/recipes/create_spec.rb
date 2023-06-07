# frozen_string_literal: true

RSpec.describe Cookbook::Actions::Recipes::Create do
  let(:cookbook) { Hanami.app["persistence.rom"].relations["cookbooks"] }
  let(:recipe) { Hanami.app["persistence.rom"].relations["recipes"] }
  let(:response) { subject.call(params) }
  let(:body) { JSON.parse(response.body.first) }
  let(:params) do
    {
      name: "My new recipe",
      blurb: "Got to make some easy meals",
      duration: 3_000,
      cookbook_id: cookbook_id
    }
  end
  let(:cookbook_id) { cookbook.insert(name: "My Cookbook") }

  before { response }

  context "with valid params" do
    it "creates a recipe" do
      expect(recipe.to_a.count).to eq(1)
    expect(recipe.to_a.first[:name]).to eq("My new recipe")
    end
  end

  context "with invalid params" do
    let(:params) { Hash[] }

    it "halts with a 422 error" do
      expect(response).to be_unprocessable
    end
  end
end
