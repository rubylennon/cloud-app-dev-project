# frozen_string_literal: true

# migration file used to create product foreign key to the order items table
class AddProductToOrderItems < ActiveRecord::Migration[7.0]
  def change
    add_reference :order_items, :product, null: false, foreign_key: true
  end
end
