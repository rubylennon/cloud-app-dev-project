class RemoveFkFromPoructCategories2 < ActiveRecord::Migration[7.0]
  def change
    remove_column :product_categories, :category_id, :integer
  end
end
