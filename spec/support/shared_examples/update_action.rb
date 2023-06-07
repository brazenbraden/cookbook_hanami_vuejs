RSpec.shared_examples_for "a update action" do |relation:|
  let(:rel) { Hanami.app["persistence.rom"].relations[relation] }
  let(:response) { subject.call(params) }
  let(:original_attributes) { { name: "original value" } }
  let(:new_value) { "sausage" }
  let(:id) { rel.insert(original_attributes) }

  before { id }

  context "when given valid params" do
    it "updates a cookbook name" do
      expect(rel.first[original_attributes.keys.first]).to eq(original_attributes.values.first)
      response
      expect(rel.first[original_attributes.keys.first]).to eq(new_value)
    end
  end
end
