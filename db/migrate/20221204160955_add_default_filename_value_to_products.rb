# frozen_string_literal: true

class AddDefaultFilenameValueToProducts < ActiveRecord::Migration[7.0]
  def change
    change_column :products, :image_filename, :string, default: 'placeholder.png'
  end
end
