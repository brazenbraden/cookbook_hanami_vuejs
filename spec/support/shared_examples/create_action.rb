RSpec.shared_examples_for "a create action" do |relation:|
  let(:rel) { Hanami.app["persistence.rom"].relations[relation] }
  let(:response) { subject.call(params) }

  context "when given valid params" do
    it "creates an item" do
      expect(response).to be_created
    end
  end

  context "when given bad params" do
    let(:params) { Hash[] }

    it "responds with unprocessable" do
      expect(response).to be_unprocessable
    end
  end
end
