# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :ingredients do
      primary_key :id
      foreign_key :type_id
      column :name, :text, null: false
      column :calories, Integer
      column :price, Float
    end
  end
end
