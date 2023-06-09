# frozen_string_literal: true

RSpec.describe "GET /cookbooks", type: :request do
  # LEAVING THIS HERE FOR NOW AS AN EXAMPLE OF A REQUEST SPEC
  let(:cookbooks) { app["persistence.rom"].relations[:cookbooks] }
  # let(:response) { subject.call(params) }
  let(:params) { Hash[] }
  let(:request_headers) do
    { "HTTP_ACCEPT" => "application/json", "CONTENT_TYPE" => "application/json" }
  end
  let(:body) { JSON.parse(last_response.body) }

  before { cookbooks.insert(name: "Baking") }

  context "when given valid params" do
    it "returns all cookbooks" do
      get "/cookbooks", params.to_json, request_headers

      expect(last_response).to be_successful
      expect(body).to eq([{ "id" => 1, "name" => "Baking" }])
    end
  end
end
