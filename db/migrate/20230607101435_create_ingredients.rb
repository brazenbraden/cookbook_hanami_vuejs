# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :ingredients do
      primary_key :id
      foreign_key :type_id
      column :name, :text, null: false, unique: true
      column :calories, Integer, default: 0
      column :price, Float, default: 0.0
      column :available, Float, default: 0.0
    end
  end
end
