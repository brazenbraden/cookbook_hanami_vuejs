# frozen_string_literal: true

RSpec.describe "GET /ingredients", type: :request do
  let(:body) { JSON.parse(last_response.body) }
  let(:names) { %w[Flour Sugar] }

  before do
    names.each { |n| Factory[:ingredient, name: n] }
  end

  context "when given valid params" do
    it "returns all cookbooks" do
      get "/ingredients"

      expect(last_response).to be_successful
      expect(body.count).to eq(2)
      expect(body.map { |i| i["name"] }.sort).to eq(names)
    end
  end
end
