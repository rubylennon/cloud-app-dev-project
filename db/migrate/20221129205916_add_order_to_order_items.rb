# frozen_string_literal: true

# migration file used to create the order items database model
class AddOrderToOrderItems < ActiveRecord::Migration[7.0]
  def change
    add_reference :order_items, :order, null: false, foreign_key: true
  end
end
