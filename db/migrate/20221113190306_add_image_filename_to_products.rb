# frozen_string_literal: true

# migration file used to add the image_filename column to the products model
class AddImageFilenameToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :image_filename, :string
  end
end
