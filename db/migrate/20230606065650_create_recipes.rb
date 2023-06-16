# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :recipes do
      primary_key :id
      column :name, :text, null: false
      column :blurb, :text
      column :image_url, :text
      column :duration, Integer
    end
  end
end
