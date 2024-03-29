# frozen_string_literal: true

# migration file used to create the orders database model
class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.decimal :sub_total, null: false, precision: 15, scale: 2

      t.timestamps
    end
  end
end
