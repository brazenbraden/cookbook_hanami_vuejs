# frozen_string_literal: true

RSpec.describe Cookbook::Actions::Cookbooks::Delete do
  let(:cookbook) { Hanami.app["persistence.rom"].relations["cookbooks"] }
  let(:response) { subject.call(params) }
  let(:cookbook_id) { cookbook.insert(name: "My cookbook") }

  context "with valid cookbook id" do
    let(:params) do
      { id: cookbook_id }
    end

    it "deletes a recipe" do
      expect(response).to be_successful
      expect(cookbook.to_a.count).to eq(0)
    end
  end

  context "with invalid cookbook id" do
    let(:params) do
      { id: 233 }
    end

    before { cookbook_id }

    xit "fails with 404" do
    end

    it "does not delete any recipe records" do
      expect(cookbook.to_a.count).to eq(1)
    end
  end
end
