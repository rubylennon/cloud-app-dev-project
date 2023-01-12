# frozen_string_literal: true

# migration file used to create the category column in the products table
class AddCategoryRequiredToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :category_required, :boolean, default: true
  end
end
