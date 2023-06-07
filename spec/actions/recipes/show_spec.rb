# frozen_string_literal: true

RSpec.describe Cookbook::Actions::Recipes::Show do
  let(:cookbooks) { Hanami.app["persistence.rom"].relations[:cookbooks] }
  let(:recipes) { Hanami.app["persistence.rom"].relations[:recipes] }
  let(:response) { subject.call(params) }
  let(:body) { JSON.parse(response.body.first) }
  let(:recipe_id) do
    cookbook_id = cookbooks.insert(name: "My cookbook")
    recipes.insert(cookbook_id: cookbook_id, name: "My recipe", blurb: "A blurb")
  end

  before { recipe_id }

  context "when recipe exists" do
    let(:params) do
      { id: recipe_id }
    end

    it "renders the cookbook" do
      expect(response).to be_successful
      expect(body["name"]).to eq("My recipe")
    end
  end

  context "when recipe does not exists" do
    let(:params) do
      { id: 222 }
    end

    it "renders the cookbook" do
      expect(response).to be_not_found
    end
  end
end
