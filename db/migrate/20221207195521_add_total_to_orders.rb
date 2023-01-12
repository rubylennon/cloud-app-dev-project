# frozen_string_literal: true

# migration file used to create the total column in the orders table
class AddTotalToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :total, :decimal
  end
end
