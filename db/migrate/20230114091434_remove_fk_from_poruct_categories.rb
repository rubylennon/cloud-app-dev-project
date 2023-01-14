class RemoveFkFromPoructCategories < ActiveRecord::Migration[7.0]
  def change
    remove_column :product_categories, :product_id, :integer
  end
end
