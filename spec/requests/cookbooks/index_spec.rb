# frozen_string_literal: true

RSpec.describe "GET /cookbooks", type: :request do
  let(:body) { JSON.parse(last_response.body) }
  let(:cookbook) { Factory[:cookbook] }

  before { cookbook }

  context "when given valid params" do
    it "returns all cookbooks" do
      get "/cookbooks"

      expect(last_response).to be_successful
      expect(body).to eq([{ "id" => cookbook.id, "name" => cookbook.name }])
    end
  end
end
