# frozen_string_literal: true

RSpec.describe "GET /cookbooks/:id", type: :request do
  let(:cookbooks) { app["persistence.rom"].relations[:cookbooks] }

  context "when a cookbook matches a given id" do
    let!(:cookbook_id) { cookbooks.insert(name: "Baking") }

    it "renders the cookbook" do
      get "/cookbooks/#{cookbook_id}"

      expect(last_response).to be_successful

      response_body = JSON.parse(last_response.body)
      expected_response = { "id" => cookbook_id, "name" => "Baking" }

      expect(response_body).to eq(expected_response)
    end
  end

  context "when a cookbook doesnt match a given id" do
    it "responds with 404" do
      get "/cookbooks/3"

      expect(last_response).to be_not_found

      response_body = JSON.parse(last_response.body)

      expect(response_body).to eq(
        "error" => "not_found"
      )
    end
  end
end
