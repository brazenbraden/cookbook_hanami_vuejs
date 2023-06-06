# frozen_string_literal: true

RSpec.describe Cookbook::Actions::Cookbooks::Create do
  let(:response) { subject.call(params) }
  let(:cookbooks) { Hanami.app["persistence.rom"].relations[:cookbooks] }

  context "when given valid params" do
    let(:params) do
      {
        cookbook: { name: "Baking" }
      }
    end

    it "creates a book" do
      expect(response).to be_created

      expect(cookbooks.last[:name]).to eq("Baking")
    end
  end

  context "when given bad params" do
    let(:params) do
      {
        cookbook: { name: "" }
      }
    end

    it "responds with 404" do
      expect(response).to be_unprocessable
    end
  end
end
