# frozen_string_literal: true

RSpec.describe "PATCH /cookbooks/:id", type: :request do
  let(:cookbooks) { app["persistence.rom"].relations[:cookbooks] }
  let(:request_headers) do
    { "HTTP_ACCEPT" => "application/json", "CONTENT_TYPE" => "application/json" }
  end

  context "when given valid params" do
    let!(:cookbook_id) { cookbooks.insert(name: "A") }
    let(:cookbook) { cookbooks.where(id: cookbook_id).one! }
    let(:params) do
      { cookbook: { name: "Baking" } }
    end

    it "updates a book" do
      expect(cookbooks.first[:name]).to eq("A")

      patch "/cookbooks/#{cookbook_id}", params.to_json, request_headers

      expect(cookbooks.first[:name]).to eq("Baking")
    end
  end
end
