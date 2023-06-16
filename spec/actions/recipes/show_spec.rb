# frozen_string_literal: true

RSpec.describe Cookbook::Actions::Recipes::Show do
  let(:response) { subject.call(params) }
  let(:body) { JSON.parse(response.body.first) }
  let(:recipe) { Factory[:recipe] }

  before { recipe }

  context "when recipe exists" do
    let(:params) do
      { id: recipe.id }
    end

    it "renders the cookbook" do
      expect(response).to be_successful
      expect(body["name"]).to eq(recipe.name)
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
