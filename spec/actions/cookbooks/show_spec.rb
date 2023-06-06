# frozen_string_literal: true

RSpec.describe Cookbook::Actions::Cookbooks::Show do
  let(:response) { subject.call(params) }
  let(:body) { JSON.parse(response.body.first) }
  let(:cookbooks) { Hanami.app["persistence.rom"].relations[:cookbooks] }

  context "when a cookbook matches a given id" do
    let(:cookbook_id) { cookbooks.insert(name: "Baking") }
    let(:params) do
      { id: cookbook_id }
    end

    it "renders the cookbook" do
      expect(response).to be_successful
      expect(body).to eq({ "id" => cookbook_id, "name" => "Baking" })
    end
  end

  context "when a cookbook doesnt match a given id" do
    let(:params) do
      { id: 3 }
    end

    it "responds with 404" do
      expect(response).to be_not_found
      expect(body).to eq(
        "error" => "not_found"
      )
    end
  end
end
