# frozen_string_literal: true

RSpec.describe Cookbook::Actions::Cookbooks::Update do
  let(:params) do
    {
      id: id,
      cookbook: { name: new_value }
    }
  end

  it_behaves_like "a update action", relation: :cookbooks
end
