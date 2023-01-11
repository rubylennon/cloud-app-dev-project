# frozen_string_literal: true

class AddTokenToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :token, :string
  end
end
