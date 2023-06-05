# frozen_string_literal: true

RSpec.describe "POST /cookbooks", type: :request do
  let(:cookbooks) { app["persistence.rom"].relations[:cookbooks] }
  let(:request_headers) do
    { "HTTP_ACCEPT" => "application/json", "CONTENT_TYPE" => "application/json" }
  end

  context "when given valid params" do
    let(:params) do
      { cookbook: { name: "Baking" } }
    end

    it "creates a book" do
      post "/cookbooks", params.to_json, request_headers

      expect(last_response).to be_created

      expect(cookbooks.last[:name]).to eq("Baking")
    end
  end

  context "when given bad params" do
    let(:params) do
      { cookbook: { name: "" } }
    end

    it "responds with 404" do
      post "/cookbooks", params.to_json, request_headers

      expect(last_response).to be_unprocessable
    end
  end
end
