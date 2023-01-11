# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :product_name
      t.text :product_description
      t.decimal :net_price

      t.timestamps
    end
  end
end
