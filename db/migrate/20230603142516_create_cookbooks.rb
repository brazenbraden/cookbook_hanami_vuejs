# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :cookbooks do
      primary_key :id
      column :name, :text, null: false
    end
  end
end
