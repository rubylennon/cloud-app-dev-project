# frozen_string_literal: true

# migration file used to create the status column to the orders database model
class AddStatusToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :status, :string, default: 'cart'
  end
end
