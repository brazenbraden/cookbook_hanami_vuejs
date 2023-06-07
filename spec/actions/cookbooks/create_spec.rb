# frozen_string_literal: true

RSpec.describe Cookbook::Actions::Cookbooks::Create do
  let(:params) do
    {
      cookbook: { name: "Baking" }
    }
  end

  it_behaves_like "a create action", relation: :cookbooks
end
