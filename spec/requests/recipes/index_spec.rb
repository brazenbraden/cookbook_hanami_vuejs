# frozen_string_literal: true

RSpec.describe "GET /recipes", type: :request do
  let(:body) { JSON.parse(last_response.body) }
  let(:recipe) { Factory[:recipe] }

  before { recipe }

  context "when given valid params" do
    it "returns all cookbooks" do
      get "/recipes"

      expect(last_response).to be_successful
      expect(body).to eq([{ "id" => recipe.id, "name" => recipe.name, "blurb" => recipe.blurb }])
    end
  end
end
