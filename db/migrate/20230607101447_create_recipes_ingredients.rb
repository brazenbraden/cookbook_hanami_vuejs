# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :recipe_ingredients do
      primary_key :id
      foreign_key :recipe_id
      foreign_key :ingredient_id
      column :amount, Integer, null: false
    end
  end
end
