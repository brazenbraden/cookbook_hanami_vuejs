# frozen_string_literal: true

RSpec.describe Cookbook::Actions::Cookbooks::Index do
  let(:cookbooks) { Hanami.app["persistence.rom"].relations[:cookbooks] }
  let(:response) { subject.call(params) }
  let(:body) { JSON.parse(response.body.first) }

  before do
    10.times { |i| Factory[:cookbook, name: "Cookbook_#{i}"] }
    response
  end

  context "with pagination" do
    let(:params) do
      {
        page: 2,
        per_page: 3
      }
    end

    it "returns a list of items" do
      expected_names = %w[Cookbook_3 Cookbook_4 Cookbook_5]

      expect(body.map { |c| c["name"] }).to eq(expected_names)
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
