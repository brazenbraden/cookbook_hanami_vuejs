RSpec.shared_examples_for "a destroy action" do |relation:|
  let(:rel) { Hanami.app["persistence.rom"].relations[relation] }
  let(:response) { subject.call(params) }
  let(:id) { rel.insert(name: "Flour") }

  context "with valid id" do
    let(:params) do
      { id: id }
    end

    it "is deleted" do
      expect(response).to be_successful
      expect(rel.to_a.count).to eq(0)
    end
  end

  context "with invalid id" do
    let(:params) do
      { id: 233 }
    end

    before { id }

    xit "fails with 404" do
    end

    it "is not deleted" do
      expect(response).to be_not_found
      expect(rel.to_a.count).to eq(1)
    end
  end
end
