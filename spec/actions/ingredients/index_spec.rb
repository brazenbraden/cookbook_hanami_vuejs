# frozen_string_literal: true

RSpec.describe Cookbook::Actions::Ingredients::Index do
  let(:ingredients) { Hanami.app["persistence.rom"].relations[:ingredients] }
  let(:response) { subject.call(params) }
  let(:body) { JSON.parse(response.body.first) }

  before do
    10.times { |i| ingredients.insert(name: "Item #{i}") }
    response
  end

  context "with pagination" do
    let(:params) do
      {
        page: 1,
        per_page: 3
      }
    end

    it "returns a list of items" do
      expected_response = [
        { "name" => "Item 0" },
        { "name" => "Item 1" },
        { "name" => "Item 2" }
      ]

      expect(body).to eq(expected_response)
    end
  end

  context "with invalid params" do
    let(:params) do
      {
        page: -1,
        per_page: 300
      }
    end

    it "return 422 with invalid params" do
      expect(response).to be_unprocessable

      expect(body).to eq(
        "errors" => {
          "page" => ["must be greater than 0"],
          "per_page" => ["must be less than or equal to 100"]
        }
      )
    end
  end
end
