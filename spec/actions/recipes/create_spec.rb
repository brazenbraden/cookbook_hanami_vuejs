# frozen_string_literal: true

RSpec.describe Cookbook::Actions::Recipes::Create do
  let(:cookbook) { Hanami.app["persistence.rom"].relations["cookbooks"] }
  let(:cookbook_id) { cookbook.insert(name: "My Cookbook") }
  let(:params) do
    {
      cookbook_id: cookbook_id,
      recipe: {
        name: "My new recipe",
        blurb: "Got to make some easy meals",
        duration: 3_000
      }
    }
  end

  it_behaves_like "a create action", relation: :recipes
end
