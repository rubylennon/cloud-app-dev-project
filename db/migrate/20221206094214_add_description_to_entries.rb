# frozen_string_literal: true

# migration file used to create the description column in the entries table
class AddDescriptionToEntries < ActiveRecord::Migration[7.0]
  def change
    add_column :entries, :description, :string
  end
end
