# frozen_string_literal: true

RSpec.describe Cookbook::Actions::Ingredients::Create do
  let(:response) { subject.call(params) }
  let(:ingredients) { Hanami.app["persistence.rom"].relations[:ingredients] }

  context "when given valid params" do
    let(:params) do
      {
        ingredient: {
          name: "Rice",
          calories: 10,
          price: 0.50
        }
      }
    end

    it "creates an ingredient" do
      expect(response).to be_created
      expect(ingredients.last[:name]).to eq("Rice")
    end
  end

  context "when given bad params" do
    let(:params) do
      {
        ingredient: { name: "" }
      }
    end

    it "responds with 404" do
      expect(response).to be_unprocessable
    end
  end
end
