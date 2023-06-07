# frozen_string_literal: true

RSpec.describe Cookbook::Actions::Cookbooks::Destroy do
  it_behaves_like "a destroy action", relation: "cookbooks"
end
