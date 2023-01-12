# frozen_string_literal: true

# migration file used to create the image column in the entries table
class AddImageToEntries < ActiveRecord::Migration[7.0]
  def change
    add_column :entries, :image, :string
  end
end
