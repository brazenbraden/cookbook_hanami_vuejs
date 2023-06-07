# frozen_string_literal: true

RSpec.describe Cookbook::Actions::Cookbooks::Update do
  let(:cookbooks) { Hanami.app["persistence.rom"].relations[:cookbooks] }
  let(:response) { subject.call(params) }

  context "when given valid params" do
    let!(:cookbook_id) { cookbooks.insert(name: "A") }
    let(:params) do
      {
        id: cookbook_id,
        cookbook: { name: "Baking" }
      }
    end

    it "updates a cookbook name" do
      expect(cookbooks.first[:name]).to eq("A")

      response

      expect(cookbooks.first[:name]).to eq("Baking")
    end
  end
end
