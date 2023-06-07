# frozen_string_literal: true

RSpec.describe Cookbook::Actions::Recipes::Destroy do
  it_behaves_like "a destroy action", relation: :recipes do
    let(:cookbook) { Hanami.app["persistence.rom"].relations["cookbooks"] }
    let(:id) do
      cookbook_id = cookbook.insert(name: "My cookbook")
      rel.insert(cookbook_id: cookbook_id, name: "My recipe", blurb: "A blurb")
    end
  end
end
