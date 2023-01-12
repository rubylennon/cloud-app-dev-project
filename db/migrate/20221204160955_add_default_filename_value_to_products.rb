# frozen_string_literal: true

# migration file used to add the default filename value to products
# image_filename column in products table
class AddDefaultFilenameValueToProducts < ActiveRecord::Migration[7.0]
  def change
    change_column :products, :image_filename, :string, default: 'placeholder.png'
  end
end
