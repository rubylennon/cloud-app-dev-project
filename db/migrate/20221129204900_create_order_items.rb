# frozen_string_literal: true

# migration file used to create the order items database model
class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.integer :quantity, null: false, default: 0
      t.decimal :price, null: false, precision: 15, scale: 2

      t.timestamps
    end
  end
end
