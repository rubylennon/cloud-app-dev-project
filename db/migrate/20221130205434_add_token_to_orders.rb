# frozen_string_literal: true

# migration file used to create the token column in the orders model
# for the shopping cart functionality
class AddTokenToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :token, :string
  end
end
