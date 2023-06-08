# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :steps do
      primary_key :id
      foreign_key :recipe_id

      column :description, :text, null: false
      column :position, Integer, default: 0
    end
  end
end
