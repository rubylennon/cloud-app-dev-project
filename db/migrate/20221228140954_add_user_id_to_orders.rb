# frozen_string_literal: true

# migration file used to add the user_id column to the orders table
class AddUserIdToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :user_id, :integer
  end
end
